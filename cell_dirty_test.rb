require './dirty_tester'
require './cell'

class CellDirtyTester < DirtyTester
  def test_cell_creation
    cell = Cell.new
    raise "Cell can't be nil" if cell.nil?
  end

  def create_cell_alive
    cell = Cell.new
    raise "Cell should be alive" unless cell.alive?
  end

  def die_cell_not_alive
    cell = Cell.new
    cell.die
    raise "Cell should die" if cell.alive?
  end

  def count_neighbours
    cell = Cell.new
    raise "No neighbours" unless cell.count_neighbours.number == 0
  end

  def add_neighbour
    cell = Cell.new
    cell.add_neighbour(Cell.new)
    raise "One neighbour" unless cell.count_neighbours.number == 1
  end

  def add_two_neighbours
    cell = Cell.new
    cell.add_neighbour(Cell.new, Cell.new)
    raise "Two neighbours" unless cell.count_neighbours.number == 2
  end

  def tic_for_next_generation_with_0_neighbours_die
    cell = Cell.new
    cell.tic
    raise "0 neighbours die" if cell.alive?
  end

  def tic_for_next_generation_with_2_neighbours_die
    cell = Cell.new
    cell.add_neighbour(Cell.new,Cell.new)
    cell.tic
    raise "2 Neighbours die" if cell.alive?
  end

  def tic_for_next_generation_with_4_neighbours_die
    cell = Cell.new
    cell.add_neighbour(Cell.new, Cell.new, Cell.new, Cell.new)
    cell.tic
    raise "4 neighbours die" if cell.alive?
  end

  def tic_for_next_generation_with_3_neighbours_live
    cell = Cell.new
    cell.add_neighbour(Cell.new, Cell.new, Cell.new)
    cell.tic
    raise "3 neighbours live" unless cell.alive?
  end

  def tic_for_next_generation_with_3_neighbours_and_shdead_should_live
    cell = Cell.new.die
    cell.add_neighbour(Cell.new, Cell.new, Cell.new)
    cell.tic
    raise "3 neighbours live" unless cell.alive?
  end

  def create_a_new_cell_without_column_and_row
    cell = Cell.new
    raise "Position should 0, 0" unless cell.position.column == 0 and cell.position.row == 0
  end

  def create_a_new_cell_with_column_and_row
    cell = Cell.new(1,5)
    raise "Position should be 1, 5" unless cell.position.column == 1 and cell.position.row == 5
  end

  def return_true_on_same_position
    cell = Cell.new
    cell2 = Cell.new
    raise "Same position should be true" unless cell.on_same_position?(cell2.position)
  end

  def return_false_on_different_position
    cell = Cell.new
    cell2 = Cell.new(5,1)
    raise "Different position should be false" if cell.on_same_position?(cell2.position)
  end

  def return_false_on_different_position
    cell = Cell.new
    cell2 = Cell.new(1,0)
    raise "Different position should be false" if cell.on_same_position?(cell2.position)
  end
end

CellDirtyTester.new.run

