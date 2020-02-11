require './lib/main_menu.rb'
require './lib/setup.rb'
require 'colorize'

class Game

  def initialize
    @menu = Menu.new
    @setup = Setup.new
  end


  def start
    @menu
    if @menu.user_decision == "p"
      @setup.place_computer_ships
      @setup.place_player_ships

      computer_ships = @setup.computer_ships
      player_ships = @setup.player_ships

      all_player_shots = []
      all_computer_shots = []

      loop do
        player_shot = nil
        computer_shot = nil
        puts "=" * 30
        puts "COMPUTER BOARD"
        puts "=" * 30
        puts @setup.computer_board.render
        puts "=" * 30
        puts "PLAYER BOARD"
        puts "=" * 30
        puts @setup.player_board.render(true)
        puts "=" * 30
        puts ""

        loop do
          puts "Enter Coordinate for your shot!:"
          player_shot = gets.chomp.upcase
          if !@setup.computer_board.valid_coordinate?(player_shot)
            puts "INVALID PLACEMENT!"
          elsif all_player_shots.any?{|shot| shot == player_shot}
            puts "You've already fired upon this cell."
          end

          break if @setup.computer_board.valid_coordinate?(player_shot) &&
          all_player_shots.none? {|shot| shot == player_shot}
        end
        @setup.computer_board.cells[player_shot].fire_upon
        all_player_shots << player_shot

        loop do
          computer_shot = @setup.player_board.cells.keys.sample

          break if all_computer_shots.none?{|shot| shot == computer_shot}
        end
        @setup.player_board.cells[computer_shot].fire_upon
        all_computer_shots << computer_shot

        if @setup.computer_board.cells[player_shot].ship.nil?
          msg = "Your shot on #{player_shot} was a miss!".red
          4.times do
            print "\r#{ msg }"
            sleep 0.3
            print "\r#{ ' ' * msg.size }"
            sleep 0.3
          end
          puts "#{player_shot} was a Miss!".red

        elsif !@setup.computer_board.cells[player_shot].ship.nil? &&
          !@setup.computer_board.cells[player_shot].ship.sunk?

          msg = "Your shot on #{player_shot} was a hit!".green
          4.times do
            print "\r#{ msg }"
            sleep 0.3
            print "\r#{ ' ' * msg.size }"
            sleep 0.3
          end
          puts "#{player_shot} was a hit!".green

        elsif !@setup.computer_board.cells[player_shot].ship.nil? &&
          @setup.computer_board.cells[player_shot].ship.sunk?
          sunk_ship = computer_ships.select{|ship| ship.sunk?}
          msg = "You sunk my battle ship!".yellow
          4.times do
            print "\r#{ msg }"
            sleep 0.3
            print "\r#{ ' ' * msg.size }"
            sleep 0.3
          end
          puts "The #{sunk_ship[0].name} Sunk!".yellow

        end

      end
    end
  end
end
