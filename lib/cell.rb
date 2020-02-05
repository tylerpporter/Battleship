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

  def render(ship = false)

    if fired_upon? == false && @has_ship == false
      return "."
    end
    if fired_upon? && @has_ship == false
      return "M"
    end
    if fired_upon? && @has_ship == true && @ship.health != 0
      return "H"
    elsif fired_upon? && @has_ship == true &&           @ship.sunk?
      return "X"
    end
    if ship == true && @has_ship == true
      return "S"

    end


  end
end
