require './lib/main_menu.rb'
require './lib/board.rb'
require './lib/ship.rb'

class Setup
attr_reader :computer_board,
            :player_board,
            :computer_ships,
            :player_ships

  def initialize(user_decision)
    if user_decision == "p"
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

    end
  end

end
