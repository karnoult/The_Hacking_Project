#!/usr/bin/env ruby

class MegaGreeter
  attr_accessor :names

  # Création d'un objet
  def initialize(names = "World")
    @names = names
  end

  # Saluer tout le monde
  def say_hi
    if @names.nil?
      puts "..."
    elsif @names.respond_to?("each")
      # @names est une liste de noms : traitons-les uns par uns
      @names.each do |name|
        puts "Hello #{name}!"
      end
    else
      puts "Hello #{@names}!"
    end
  end

  # Dire au revoir à tout le monde
  def say_bye
    if @names.nil?
      puts "..."
    elsif @names.respond_to?("join")
      # Grouper les différents noms de la liste par des virgules
      puts "Goodbye #{@names.join(", ")}.  Come back soon!"
    else
      puts "Goodbye #{@names}.  Come back soon!"
    end
  end

end


if __FILE__ == $0
  mg = MegaGreeter.new
  mg.say_hi
  mg.say_bye

  # Modifier le nom en Zeke
  mg.names = "Zeke"
  mg.say_hi
  mg.say_bye

  # Changer le nom pour un tableau (une liste de noms)
  mg.names = ["Albert", "Brenda", "Charles",
    "Dave", "Engelbert"]
  mg.say_hi
  mg.say_bye

  # Maintenant, le nom n'est plus...
  mg.names = nil
  mg.say_hi
  mg.say_bye
end
