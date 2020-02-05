require 'Minitest/autorun'
require 'Minitest/pride'
require './lib/ship'
require './lib/cell'

class CellTest < Minitest::Test
  def setup
    @cruiser = Ship.new("Cruiser", 3)
    @cell = Cell.new("D2")
    @cell_1 = Cell.new("D3")
    @cell_2 = Cell.new("D4")
  end

  def test_it_exists
    assert_instance_of Cell, @cell
  end

  def test_cell_has_a_coordinate
    assert_equal "D4", @cell_2.coordinate
  end

  def test_a_cell_can_contain_ship
    assert_nil @cell.ship
    @cell.place_ship(@cruiser)
    assert_instance_of Ship, @cell.ship
  end

  def test_the_cell_is_empty
    assert_equal true, @cell.empty?
    @cell.place_ship(@cruiser)
    assert_equal false, @cell.empty?
  end

  def test_it_confirms_if_fired_upon
    assert_equal false, @cell.fired_upon?
  end

  def test_fire_upon_reduces_health_by_one
    @cell.place_ship(@cruiser)
    @cell.fire_upon
    assert_equal 2, @cell.ship.health
    assert_equal true, @cell.fired_upon?
  end

  def test_render_dot_if_an_empty_cell
    assert_equal ".", @cell.render

  end

  def test_render_M_if_fired_upon_and_no_ship
    @cell.fire_upon
    assert_equal "M", @cell.render

  end

  def test_render_cell_has_been_fired_upon_and_has_ship
    @cell.place_ship(@cruiser)
    @cell.fire_upon

    assert_equal "H", @cell.render

  end

  def test_render_if_ship_has_been_sunk

    @cell.place_ship(@cruiser)
    @cell.fire_upon
    @cruiser.hit
    @cruiser.hit
    @cruiser.hit

    assert @cruiser.sunk?
    assert_equal "X", @cell.render

  end

  def test_render_can_reveal_ship
    @cell.place_ship(@cruiser)

    assert_equal "S", @cell.render(true)
  end
end
