require_relative 'test_helper.rb'
require './lib/setup.rb'

class SetupTest < Minitest::Test
def setup
  @setup = Setup.new

end
  def test_it_exists

  assert_instance_of Setup, @setup
  end

  def test_if_it_stores_attributes

    assert_equal Board, @setup.computer_board.class
    assert_equal Ship, @setup.computer_ships.first.class
    assert_equal Array, @setup.player_ships.class
  end

  def test_it_can_place_computer_ships
    @setup.place_computer_ships
    any_ships =  @setup.computer_board.cells.values.any? do |cell|
      cell.ship != nil
    end

    assert any_ships
  end

  def test_if_player_has_placed_ships
    @setup.place_player_ships
    any_ships =  @setup.player_board.cells.values.any? do |cell|
      cell.ship != nil
    end

    assert any_ships
  end

end
