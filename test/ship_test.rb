require 'Minitest/autorun'
require 'Minitest/pride'
require './lib/ship'

class ShipTest < Minitest::Test

  def setup
    @cruiser = Ship.new("Cruiser", 3)
  end

  def test_when_hit_loses_one_health
    @cruiser.hit

    assert_equal 2, @cruiser.health
  end

  def test_if_sunk
    @cruiser.hit
    @cruiser.hit
    @cruiser.hit

    assert @cruiser.sunk?
  end
end
