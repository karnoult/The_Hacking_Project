require 'sinatra'
require 'sinatra/reloader'

class WebGuesser

  :max_below
  :min_above

  def initialize
    reset
  end

  def check_guess(user_value)
    msg = ""
    if user_value > @value_to_guess
      @min_above = user_value if user_value < @min_above
      return ["Your last guess (#{user_value}) is too high", get_helper]
    elsif user_value < @value_to_guess
      @max_below = user_value if user_value > @max_below
      return ["Your last guess (#{user_value}) is too low", get_helper]
    else
      return ["<strong>Your last guess (#{user_value}) is the right guess!</strong>", ""]
    end


  end

  def get_helper
    return "<mark class='too_low'>#{@max_below}</mark>  >>>  ?  <<<  <mark class='too_high'>#{@min_above}</mark>"
  end

  def reset
    @value_to_guess = rand(100)
    @max_below = 0
    @min_above = 100
  end
end

the_web_guesser = WebGuesser.new

get '/' do
  if params["guess"].nil? || !params["reset"].nil?
    the_web_guesser.reset
    erb :index, :locals => {:result => ["It's time for you to enter a value!", ""]}
  else
    erb :index, :locals => {:result => the_web_guesser.check_guess(params["guess"].to_i)}
  end
end
