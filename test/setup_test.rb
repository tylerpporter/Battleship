require_relative 'test_helper.rb'
require './lib/setup.rb'

class SetupTest < Minitest::Test
def setup
  @setup = Setup.new("p")

end
  def test_it_exists

  assert_instance_of Setup, @setup
  end

  def test_if_it_stores_attributes

    assert_equal Board, @setup.computer_board.class
    assert_equal Ship, @setup.computer_ships.first.class
    assert_equal Array, @setup.player_ships.class
  end

end
