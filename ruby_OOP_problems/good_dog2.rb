module Walkable
  def walk
    puts "I'm walking"
  end
end

module Swimmable
  def swim
    puts "I'm swimming"
  end
end

module Climbable
  def climb
    puts "I'm climbing"
  end
end

module Mammal
  class Dog
    def speak(sound)
      p "#{sound}"
    end
  end

  class Cat
    def say_name(name)
      p "#{name}"
    end
  end
end

class Animal
  include Walkable

  def speak
    puts "I'm an animal, and I speak!"
  end
  attr_accessor :name
  #
  def initialize(name)
    @name = name
  end
end

class Fish < Animal
  include Swimmable
end
#
class Mammal < Animal
end

class GoodDog < Animal
  def initialize(color)
    super
    @color = color
  end
end
#
class BadDog < Animal
  def initialize(age, name)
    super(name)
    @age = age
  end
end

class Cat < Animal
end
#
class Dog < Animal
  include Swimmable
  include Climbable
end

p bruno = GoodDog.new("brown")
sparky = Dog.new
paws = Cat.new
neemo = Fish.new
neemo.swim
sparky.swim
paws.swim


p BadDog.new(2, 'bear')

puts "---Animal method lookup---"
puts Animal.ancestors

fido = Animal.new
fido.speak
fido.walk
fido.swim

puts "---Dog method lookup---"
puts Dog.ancestors

buddy = Mammal::Dog.new
kitty = Mammal::Cat.new
buddy.speak("Arf!")
kitty.say_name("kitty")
value = Mammal.some_out_of_place_method(4)
