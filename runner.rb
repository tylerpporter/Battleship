puts "Welcome to BATTLESHIP"
puts "------------------------"
puts "Enter p to play. Enter q to quit."
user_decision = gets.chomp.downcase
if user_decision == "q"
  puts "Your garbage anyways."
elsif
  user_decision == "p"
  puts "Great, lets begin!"
end
