require "./lib/cell.rb"

class Board
attr_reader :cells

  def initialize()
    @cells = {
 "A1" => Cell.new("A1"),
 "A2" => Cell.new("A2"),
 "A3" => Cell.new("A3"),
 "A4" => Cell.new("A4"),
 "B1" => Cell.new("B1"),
 "B2" => Cell.new("B2"),
 "B3" => Cell.new("B3"),
 "B4" => Cell.new("B4"),
 "C1" => Cell.new("C1"),
 "C2" => Cell.new("C2"),
 "C3" => Cell.new("C3"),
 "C4" => Cell.new("C4"),
 "D1" => Cell.new("D1"),
 "D2" => Cell.new("D2"),
 "D3" => Cell.new("D3"),
 "D4" => Cell.new("D4"),
}

  end
  def valid_coordinate?(key)
     @cells.keys.any? do |coordinate|
       coordinate == key
     end
  end

  def valid_placement?(ship, coordinate)
      return false if ship.length != coordinate.size
      return false if coordinate.any? {|key| @cells[key].ship != nil}

      rows = coordinate.map(&:chars).map { |arr| arr[0] }
      columns = coordinate.map(&:chars).map { |arr| arr[1] }

      if rows.uniq.size == 1 &&
        columns.map(&:to_i).each_cons(2).all? {|num1, num2| num2 == num1 + 1}
        true
      elsif
        columns.uniq.size == 1 &&
        rows.map(&:ord).each_cons(2).all? {|num1, num2| num2 == num1 + 1}
        true
      else
        false
      end
  end

  def place(ship, coordinate)
    return "Invalid coordinate" if !valid_placement?(ship, coordinate)

    coordinate.each {|key| @cells[key].place_ship(ship)}
  end

  def render(ship = false)
    columns = ["1", "2", "3", "4"]
    rows = ["A ", "B ", "C ", "D "]

    columns.unshift(" ") unless columns[0] == " "
    string_columns = columns.join(" ") + " \n"
    key_grid = @cells.keys.group_by { |key| key[0]}.values
    render_grid = key_grid.map { |row| row.map {|key| @cells[key].render(ship)}}
    render_string = render_grid.map { |arr| arr.join(" ") + " \n"  }
    string_columns + rows.zip(render_string).flatten.join
  end
end
