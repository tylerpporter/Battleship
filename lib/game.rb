require './lib/main_menu.rb'
require './lib/setup.rb'

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
        puts "COMPUTER BOARD"
        puts "=" * 30
        puts @setup.computer_board.render
        puts "=" * 30
        puts "PLAYER BOARD"
        puts "=" * 30
        puts @setup.player_board.render(true)
        puts "=" * 30

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
          puts "Your shot on #{player_shot} was a miss!"
        elsif !@setup.computer_board.cells[player_shot].ship.nil? &&
          !@setup.computer_board.cells[player_shot].ship.sunk?
          puts "Your shot on #{player_shot} was a hit!"
        elsif !@setup.computer_board.cells[player_shot].ship.nil? &&
          @setup.computer_board.cells[player_shot].ship.sunk?
          puts "You sunk my battle ship!"
        end

      end
    end
  end
end
