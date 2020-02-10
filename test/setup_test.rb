require_relative 'test_helper.rb'
require './lib/setup.rb'

class SetupTest < Minitest::Test

  def test_it_exists

  assert_instance_of Setup, Setup.new("p")
  end

  def test_if_it_stores_attributes

    assert_equal Board, Setup.new("p").computer_board.class
    assert_equal Ship, Setup.new("p").computer_ships.first.class
    assert_equal Array, Setup.new("p").player_ships.class
  end

end
