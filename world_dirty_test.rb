require './dirty_tester'
require './world'
require './cell'

class WorldDirtyTester < DirtyTester
  def create_empty_world
    world = World.new
    raise "World without cells" unless world.number_of_cells.number == 0
  end

  def create_world_with_one_cell
    world = World.new(Cell.new)
    raise "World with one cell" unless world.number_of_cells.number == 1
  end

  def add_cells_method_with_one_cell
    world = World.new
    world.add_cells(Cell.new)
    raise "World with one cell" unless world.number_of_cells.number == 1
  end

  def dont_add_duplicated_cells
    world = World.new(Cell.new)
    world.add_cells(Cell.new)
    raise "Dont add duplicated cells" unless world.number_of_cells.number == 1
  end

  def neighbouring_the_adjacents
    cell = Cell.new
    world = World.new(cell)
    world.add_cells(Cell.new(1,0))
    raise "Adjacents should be neigbours" unless cell.count_neighbours.number == 1
  end

end

WorldDirtyTester.new.run
