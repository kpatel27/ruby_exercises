=begin
You have a bank of switches before you, numbered from 1 to n. Each switch is
connected to exactly one light that is initially off. You walk down the row of
switches and toggle every one of them. You go back to the beginning, and on this
second pass, you toggle switches 2, 4, 6, and so on. On the third pass, you go
back again to the beginning and toggle switches 3, 6, 9, and so on. You repeat
this process and keep going until you have been through n repetitions.

Write a method that takes one argument, the total number of switches, and returns
an Array that identifies which lights are on after n repetitions.
=end

def lights_on(number_of_lights)
  #initialize lights array where all lights are off(false)
  light_bulbs = [false] * number_of_lights

  #toggle nth lights on every pass
  for pass in 1..number_of_lights do
    light_bulbs.map!.with_index do |status, index|
      #if the lightbulb is a multiple of the current pass, change lightbulb status
      (index + 1) % pass == 0 ? !status : status
    end
  end

  lights_on = []
  lights_off = []
  #if light is on, add the light_bulb number to lights_on array
  light_bulbs.each_with_index do |status, index|
    status ? lights_on << index + 1 : lights_off << index + 1
  end

  puts "Lights on: #{lights_on}"
  puts "Lights off: #{lights_off}"
end

lights_on(1000) == [1, 4, 9, 16, 25, 36, 49, 64, 81, 100, 121, 144, 169, 196, 225, 256, 289, 324, 361, 400, 441, 484, 529, 576, 625, 676, 729, 784, 841, 900, 961]
