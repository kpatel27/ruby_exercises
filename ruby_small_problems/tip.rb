#Create a simple tip calculator. The program should prompt for a bill amount and a tip rate. The program must compute the tip and then display both the tip and the total amount of the bill.

def calc_bill(bill, tip)
  puts "Your bill amount is #{"%0.2f"% bill} and you would like to tip #{"%0.2f"% tip}%"
  tip_amount = bill * (tip / 100)
  total_bill = bill + tip_amount
  puts "That comes out to #{"%0.2f" % tip_amount} in tips which makes your total bill #{"%0.2f" % total_bill}"
end


puts "==> Enter the bill amount"
bill = gets.chomp.to_f
puts "==> Enter the tip percentage"
tip_percent = gets.chomp.to_f

calc_bill(bill, tip_percent)
