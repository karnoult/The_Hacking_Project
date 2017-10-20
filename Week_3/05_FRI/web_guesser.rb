require 'sinatra'
require 'sinatra/reloader'

class WebGuesser

  attr_accessor :value_to_guess

  def initialize
    reset
  end

  def check_guess(user_value)
    if user_value > value_to_guess
      @values_entered << "<mark class='too_high'>#{user_value}</mark>"
      return ["Your last guess is too high", @values_entered]
    elsif user_value < value_to_guess
      @values_entered << "<mark class='too_low'>#{user_value}</mark>"
      return ["Your last guess is too low", @values_entered]
    else
      @values_entered << "<mark class='right_guess'>#{user_value}</mark>"
      return ["Your last guess is the right guess!", @values_entered]
    end
  end

  def reset
    @value_to_guess = rand(100)
    @values_entered = []
  end
end

the_web_guesser = WebGuesser.new

get '/' do
  if params["guess"].nil?
    the_web_guesser.reset
    erb :index, :locals => {:result => ["It's time for you to enter a value!", []]}
  else
    erb :index, :locals => {:result => the_web_guesser.check_guess(params["guess"].to_i)}
  end
end
