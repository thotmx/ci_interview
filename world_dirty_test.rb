require './dirty_tester'
require './world'
require './cell'

class WorldDirtyTester < DirtyTester

  def create_empty_world
    world = World.new
    raise "Fail" unless world.number_of_cells.number == 0
  end

  def create_world_with_one_cell
    world = World.new(Cell.new)

    raise "Fail" unless world.number_of_cells.number == 1
  end

end

WorldDirtyTester.new.run
