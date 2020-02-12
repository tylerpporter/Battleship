require './lib/menu.rb'
require './lib/board.rb'
require './lib/ship.rb'

class Setup
attr_reader :computer_board,
            :player_board,
            :computer_ships,
            :player_ships

  def initialize
      @computer_board = Board.new
      @player_board = Board.new
      computer_ship1 = Ship.new("Submarine", 2)
      computer_ship2 = Ship.new("Cruiser", 3)
      player_ship1 = Ship.new("Submarine", 2)
      player_ship2 = Ship.new("Cruiser", 3)
      @computer_ships = [computer_ship1, computer_ship2]
      @player_ships = [player_ship1, player_ship2]
  end

  def place_computer_ships
    @computer_ships.each do |ship|
      coordinates = []
      loop do
        coordinates = []
        (ship.length).times do
          coordinates << @computer_board.cells.keys.sample
        end
        break if @computer_board.valid_placement?(ship, coordinates)
      end
      @computer_board.place(ship, coordinates)
    end
  end

  def place_player_ships
    puts ""
    puts "=" * 30
    puts "I have laid out my ships on the grid."
    puts "-" * 30
    puts "You now need to lay out your two ships."
    puts "-" * 30
    puts "The Cruiser is three units long and the Submarine is two units long."
    puts "=" * 30
    puts @player_board.render(true)
    puts "=" * 30
    player_coordinates = nil
    cruiser = nil
    loop do
      puts "Enter the squares for the Cruiser (3 spaces, example: A1 A2 A3):"
      user_input = gets.chomp.gsub(/[^a-zA-Z1-9]/, " ")
      player_coordinates = user_input.upcase.split(" ")
      cruiser = @player_ships[1]
      break if @player_board.valid_placement?(cruiser, player_coordinates)
    end
    @player_board.place(cruiser, player_coordinates)
    submarine = nil
    loop do
      puts "Enter the squares for the Submarine ( 2 spaces, example: B1 C1 ):"
      user_input = gets.chomp.gsub(/[^a-zA-Z1-9]/, " ")
      player_coordinates = user_input.upcase.split(" ")
      submarine = @player_ships[0]
      break if @player_board.valid_placement?(submarine, player_coordinates)
    end
    @player_board.place(submarine, player_coordinates)
  end

end
