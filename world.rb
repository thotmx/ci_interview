require 'ostruct'

class World
  def initialize(*cells)
    @cells=cells
  end

  def number_of_cells
    OpenStruct.new(number: @cells.size)
  end
end
