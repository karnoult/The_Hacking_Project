require 'pry'

class Player

  attr_accessor :name
  attr_accessor :sign

  def initialize(_name, _sign)
    @name = _name
    @sign = _sign # character that will be displayed when the player marks a space
  end

end

class BoardSpace

  attr_accessor :id

  attr_accessor :state # can be either an empty string or a reference to a player sign

  def initialize(_id)
    @id = _id
    @state = _id
  end

end

class Board

  attr_accessor :board_spaces # stores the 9 spaces
  attr_accessor :winning_combinations # combinations of spaces that need to be filled by a player in order to win

  def initialize
    # fills the 9 spaces
    @board_spaces = []
    (1..9).each do |i|
      @board_spaces << BoardSpace.new(i)
    end

    # defines the wining combinations
    @winning_combinations = [
      [1, 2, 3], [4, 5, 6], [7, 8, 9],
      [1, 4, 7], [2, 5, 8], [3, 6, 9],
      [1, 5, 9], [7, 8, 9],
    ]
  end

  def display_board
    line_display = ""

    puts "-------------"

    @board_spaces.each do |board_space|
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

class Game

  def initialize
    @turns = 0 # count turns played
  end

  def launch_game
    # creates players
    @players = [Player.new("PLAYER_2", "O"), Player.new("PLAYER_1", "X")]

    # creates board and display it
    @board = Board.new
    @board.display_board

    loop do
      @turns += 1
      play_turn
      if is_there_a_winner # if a player has won leave the game
        puts "#{@players[@turns%2].name} A GAGNE"
        break
      elsif @turns == 9 # after 9 turns, if no one has won leave the game
        puts "EGALITE"
        break
      end
    end
  end

  def play_turn
    puts "#{@players[@turns%2].name} c'est a ton tour de jouer :"
    case_selected = gets.chomp
    # binding.pry
    @board.board_spaces[case_selected.to_i - 1].state = @players[@turns%2].sign
    @board.display_board
  end

  def is_there_a_winner
    return false if @turns < 5

    @board.winning_combinations.each do |winning_spaces|
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
