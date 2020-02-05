require 'Minitest/autorun'
require 'Minitest/pride'
require './lib/ship'

  class ShipTest < Minitest::Test

  def setup
    @cruiser = Ship.new("Cruiser", 3)
  end
  end
