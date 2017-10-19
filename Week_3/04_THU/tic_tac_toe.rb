require 'pry'

class Player

  attr_accessor :name
  attr_accessor :sign

  def initialize(_name, _sign)
    @name = _name
    @sign = _sign
  end

end

class Board

  attr_accessor :board_spaces
  attr_accessor :all_winning_spaces

  def initialize
    @board_spaces = []
    (1..9).each do |i|
      @board_spaces << BoardSpace.new(i)
    end

    @all_winning_spaces = [
      [1, 2, 3], [4, 5, 6], [7, 8, 9],
      [1, 4, 7], [2, 5, 8], [3, 6, 9],
      [1, 5, 9], [7, 8, 9],
    ]
  end

  def display_board
    line_display = ""

    puts "-------------"

    @board_spaces.each do |board_space|
      # binding.pry
      case board_space.id % 3
      when 1..2
        line_display += "| #{board_space.state} "
      when 0
        line_display += "| #{board_space.state} |"
        puts line_display
        line_display = ""
        puts "-------------"
      end
    end
  end

end

class BoardSpace

  attr_accessor :id

  # can be either an empty string or a reference to a player sign
  attr_accessor :state

  def initialize(_id)
    @id = _id
    @state = _id
  end

end

class Game

  attr_accessor :board
  attr_accessor :players

  def initialize
    @turns = 0
  end

  def launch_game
    @players = [Player.new("PLAYER_2", "O"), Player.new("PLAYER_1", "X")]
    @board = Board.new

    @board.display_board

    loop do
      @turns += 1
      play_turn
      if @turns == 9
        puts "EGALITE"
        break
      elsif is_there_a_winner
        puts "#{@players[@turns%2].name} A GAGNE"
        break
      end
    end
  end

  def play_turn
    case_selected = gets.chomp
    # binding.pry
    @board.board_spaces[case_selected.to_i - 1].state = @players[@turns%2].sign
    @board.display_board
  end

  def is_there_a_winner
    return false if @turns < 5

    @board.all_winning_spaces.each do |winning_spaces|
      checked_spaces = []
      winning_spaces.each do |i|
        checked_spaces << @board.board_spaces[i-1].state
      end
      concat_spaces = checked_spaces.join
      if !concat_spaces.include?(" ")
        case concat_spaces
        when @players[0].sign * 3
          return @players[0]
        when @players[1].sign * 3
          return @players[1]
        end
      end
    end

    return false
  end

end

my_game = Game.new
my_game.launch_game
