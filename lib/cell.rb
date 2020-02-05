class Cell

  attr_reader :coordinate, :has_ship
  attr_accessor :ship, :show_ships, :fired_upon

  def initialize(coordinate)
  @coordinate = coordinate
  @fired_upon = false
  @has_ship = false
  @show_ships = false
  end

  def place_ship(ship)
    @has_ship = true
    @ship = ship
  end

  def empty?
    return true if @ship == nil
    false
  end

  def fire_upon
    if !empty?
      @ship.health -= 1
    end
   @fired_upon = true
  end

  def fired_upon?
    @fired_upon
  end

  def render(argument)
    #Work on render method tomorrow
  end
end
