=begin
Write a method that takes a positive integer, n, as an argument, and displays a right triangle whose sides
each have n stars. The hypotenuse of the triangle (the diagonal side in the images below) should have one
end at the lower-left of the triangle, and the other end at the upper-right.
=end

def triangle(length)
  for i in 1..length do
  puts "#{' ' * (length - i)}#{'*' * i}"
  end
end

=begin

triangle(5)

    *
   **
  ***
 ****
*****

triangle(9)

        *
       **
      ***
     ****
    *****
   ******
  *******
 ********
*********

=end
