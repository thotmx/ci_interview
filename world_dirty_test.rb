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

  def get_the_number_of_colonies_empty_world
    world = World.new()
    raise "Empty world 0 colonies" unless world.count_the_colonies.number == 0
  end

  def the_number_of_colonies_with_one_cell
    world = World.new(Cell.new)
    raise "One cell world 1 colony" unless world.count_the_colonies.number == 1
  end

  def the_number_of_colonies_with_two_adjacents_cells
    world = World.new(Cell.new(0,0), Cell.new(1,0))
    raise "Two adjacents cells world 1 colony" unless world.count_the_colonies.number == 1
  end

  def the_number_of_colonies_with_three_not_adjacents_cells
    world = World.new(Cell.new(0,0), Cell.new(2,0), Cell.new(5,0))
    raise "Three not adjacents cells world 3 colonies" unless world.count_the_colonies.number == 3
  end

  def the_test_case_of_the_interview
    # 0 0 0 0 0 1 0
    # 1 1 0 1 0 1 0
    # 1 1 0 0 0 0 0
    # 1 1 0 0 1 0 0
    # 0 0 1 0 1 1 0
    # 0 0 1 0 1 0 0
    # 0 0 0 0 1 0 0
    world = World.new( Cell.new(5,0),

                      Cell.new(0,1),
                      Cell.new(1,1),
                      Cell.new(3,1),
                      Cell.new(5,1),

                      Cell.new(0,2),
                      Cell.new(1,2),

                      Cell.new(0,3),
                      Cell.new(1,3),
                      Cell.new(4,3),

                      Cell.new(2,4),
                      Cell.new(4,4),
                      Cell.new(5,4),

                      Cell.new(2,5),
                      Cell.new(4,5),

                      Cell.new(4,6)
                     )

    raise "The interview case should be 4" unless world.count_the_colonies.number == 4
  end
end

WorldDirtyTester.new.run
