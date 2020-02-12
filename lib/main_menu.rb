class Menu
  attr_reader :user_decision
  def start
    banner0 = "██████╗  █████╗ ████████╗████████╗██╗     ███████╗███████╗██╗  ██╗██╗██████╗ ".red
    banner1 = "██╔══██╗██╔══██╗╚══██╔══╝╚══██╔══╝██║     ██╔════╝██╔════╝██║  ██║██║██╔══██╗".white
    banner2 = "██████╔╝███████║   ██║      ██║   ██║     █████╗  ███████╗███████║██║██████╔╝".blue
    banner3 = "██╔══██╗██╔══██║   ██║      ██║   ██║     ██╔══╝  ╚════██║██╔══██║██║██╔═══╝ ".red
    banner4 = "██████╔╝██║  ██║   ██║      ██║   ███████╗███████╗███████║██║  ██║██║██║     ".white
    banner5 = "╚═════╝ ╚═╝  ╚═╝   ╚═╝      ╚═╝   ╚══════╝╚══════╝╚══════╝╚═╝  ╚═╝╚═╝╚═╝     ".blue
    banner7 = "███████╗███████╗███████╗███████╗███████╗███████╗███████╗███████╗███████╗███████╗".white
    banner8 = "╚══════╝╚══════╝╚══════╝╚══════╝╚══════╝╚══════╝╚══════╝╚══════╝╚══════╝╚══════╝".white
    msg7 = "Enter".red
    msg8 = "p".bold.red
    msg9 = "to".white
    msg10 = "play or".blue
    msg11 = "q".bold.blue
    msg12 = "to quit.".blue
    puts ""
    puts "#{banner0}"
    puts "#{banner1}"
    puts "#{banner2}"
    puts "#{banner3}"
    puts "#{banner4}"
    puts "#{banner5}"
    puts "#{banner7}"
    puts "#{banner8}"
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
