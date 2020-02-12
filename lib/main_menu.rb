class Menu
  attr_reader :user_decision

  def start
    msg1 = "Welcome".bold.red
    msg2 = "to".bold.white
    msg3 = "BATTLESHIP!".bold.blue
    msg4 = "-------".red
    msg5 = "----".white
    msg6 = "-----------".blue
    msg7 = "Enter".red
    msg8 = "p".bold.red
    msg9 = "to".white
    msg10 = "play or".blue
    msg11 = "q".bold.blue
    msg12 = "to quit.".blue
  puts "#{msg1} #{msg2} #{msg3}"
  puts "#{msg4}#{msg5}#{msg6}"
  puts "#{msg7} #{msg8} #{msg9} #{msg10} #{msg11} #{msg12}"
  puts ""
  @user_decision = gets.chomp.downcase
    if @user_decision == "q"
      puts "Okay, maybe next time!".red
    elsif @user_decision == "p"
      puts "Great, lets begin!".green
    elsif @user_decision != "p" || @user_decision != "q"
      puts "Invalid Answer, try again.".red
    end
  end

end
