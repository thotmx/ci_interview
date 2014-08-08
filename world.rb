require 'ostruct'

class World
  def initialize(*cells)
    @cells = []
    cells.each { |cell| add_cells(cell)}
  end

  def number_of_cells
    OpenStruct.new(number: @cells.size)
  end

  def add_cells(*cells)
    cells.each do |cell|
      unless is_a_repeated_cell?(cell)
        @cells << cell
        assign_neighbours(cell)
      end
    end
  end

  def count_the_colonies
    OpenStruct.new(number: colonies.size)
  end

  private
  def colonies
    colonies_array = []
    @cells.each {|cell| colonies_array.push(cell.colony_members) unless is_in_a_colony?(colonies_array, cell) }
    colonies_array
  end

  def is_in_a_colony?(colonies_array, member)
    colonies_array.any?{ |colony| colony.include?(member) }
  end

  def assign_neighbours(new_cell)
    @cells.each do |cell|
      cell.add_neighbour(new_cell)
    end
  end

  def is_a_repeated_cell?(another_cell)
    @cells.any?{ |cell| cell.on_same_position?(another_cell.position) }
  end
end
