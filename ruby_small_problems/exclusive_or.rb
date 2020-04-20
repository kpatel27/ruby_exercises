#In this exercise, you will write a method named xor that takes two arguments, and returns true if exactly one of its arguments is truthy, false otherwise.

def xor?(operand1, operand2)
  ( operand1 && !operand2 ) || ( !operand1 && operand2 )
end

xor?(5.even?, 4.even?)
