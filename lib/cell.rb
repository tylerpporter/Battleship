class Cell
  attr_reader :coordinate, :ship, :fired_upon

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
    @fired_upon = false
  end

  def empty?
    @ship.nil?
  end

  def place_ship(ship)
    @ship = ship
  end

  def fire_upon
    return "Already fired upon this cell!".red if fired_upon?
    @fired_upon = true
    if @ship != nil
      @ship.hit
    end
  end

  def fired_upon?
    @fired_upon
  end

  def render(reveal_ship = false)
    return ".".light_white if !fired_upon? && !reveal_ship
    return ".".light_white if !fired_upon? && empty?
    return "M".cyan if empty? && fired_upon?
    return "S".green if reveal_ship && !empty? && !fired_upon?
    if !empty? && !@ship.sunk? && fired_upon?
      "H".yellow
    elsif !empty? && @ship.sunk? && fired_upon?
      "X".red
    end
  end

end
