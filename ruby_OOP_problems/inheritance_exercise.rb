module Drivable
  def drive
    puts "It can drive"
  end
end

class Vehicle
  @@number_of_vehicles = 0

  attr_accessor :color
  attr_reader :year

  def intialize
    @@number_of_vehicles += 1
  end

  def self.number_of_vehicles
    puts "There are #{@@number_of_vehicles} vehicles"
  end

  def initialize(year, color, model)
    @year = year
    @color = color
    @model = model
    @speed = 0
  end

  def age
    puts "My #{@model} is #{years_old} years old."
  end

  def speed
    puts "#{@speed} mph."
  end

  def speed_up(num)
    @speed += num
    puts "#{num} mph."
  end

  def break(num)
    @speed -= num
    puts "#{num} mph."
  end

  def shut_off
    @speed = 0
    puts "Car stopped"
  end

  def spray_paint(c)
    self.color = c
    puts "Your color is now #{c}"
  end

  def self.gas_mileage(gallons, miles)
    puts "#{miles / gallons} miles per gallon of gas"
  end

  private

  def years_old
    Time.now.year - self.year
  end
end

class MyCar < Vehicle
  NUMBER_OF_WHEELS = 4

  include Drivable

  def to_s
    "My car is a #{color}, #{year}, #{@model}!"
  end
end

class MyTruck < Vehicle
  NUMBER_OF_WHEELS = 18

  include Drivable

  def to_s
    "My truck is a #{color}, #{year}, #{@model}!"
  end
end

my_vehicle = MyCar.new(2014, "blue", "new vitara")

puts my_vehicle.age
my_vehicle.speed_up(30)
my_vehicle.speed
my_vehicle.speed_up(30)
my_vehicle.speed
my_vehicle.break(30)
my_vehicle.speed
my_vehicle.break(30)
my_vehicle.speed
my_vehicle.shut_off
my_vehicle.speed

my_vehicle.color = "white"
puts "The Suzuki New Vitara color is now #{my_vehicle.color}."
puts "The model was launched in #{my_vehicle.year}."
my_vehicle.spray_paint("black")

MyCar.gas_mileage(13, 351)
puts my_vehicle
