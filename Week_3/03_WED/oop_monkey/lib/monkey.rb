class Monkey

  attr_accessor :name
  attr_accessor :species
  attr_accessor :foods_eaten

  def initialize(name, species)
    @name = name.capitalize
    @species = species
    @foods_eaten = []
  end

  def eat(food)
    @foods_eaten << food if !food.start_with?("a", "e", "i", "o", "u")
  end

  def introduce
    return "Hello my name is #{@name}.capitalize and I am a #{@species}" +
            "and I've just eaten #{@foods_eaten}"
  end

end
