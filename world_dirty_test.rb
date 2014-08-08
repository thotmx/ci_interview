require './dirty_tester'
require './world'

class WorldDirtyTester < DirtyTester

  def create_empty_world
    world = World.new
    raise "Fail" unless world.number_of_cells.number == 0
  end

end

WorldDirtyTester.new.run
