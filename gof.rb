require './cell'

class DirtyTester
  def run
    self.class.instance_methods(false).each do |method|
      send(method) unless method == :run
    end
  end
end

class CellDirtyTester < DirtyTester
  def test_cell_creation
    cell = Cell.new
    raise "Fail" if cell.nil?
  end

  def create_cell_alive
    cell = Cell.new
    raise "Fail" unless cell.alive?
  end

  def die_cell_not_alive
    cell = Cell.new
    cell.die
    raise "Fail" if cell.alive?
  end

  def count_neighbours
    cell = Cell.new
    raise "Fail" unless cell.count_neighbours.number == 0
  end

  def add_neighbour
    cell = Cell.new
    cell.add_neighbour(Cell.new)
    raise "Fail" unless cell.count_neighbours.number == 1
  end

  def add_two_neighbours
    cell = Cell.new
    cell.add_neighbour(Cell.new, Cell.new)
    raise "Fail" unless cell.count_neighbours.number == 2
  end

  def tic_for_next_generation_with_0_neighbours_die
    cell = Cell.new
    cell.tic
    raise "Fail" if cell.alive?
  end

  def tic_for_next_generation_with_2_neighbours_die
    cell = Cell.new
    cell.add_neighbour(Cell.new,Cell.new)
    cell.tic
    raise "Fail" if cell.alive?
  end

  def tic_for_next_generation_with_4_neighbours_die
    cell = Cell.new
    cell.add_neighbour(Cell.new, Cell.new, Cell.new, Cell.new)
    cell.tic
    raise "Fail" if cell.alive?
  end


end

CellDirtyTester.new.run

DirtyTester.new.run

