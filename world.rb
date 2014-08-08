require 'ostruct'

class World
  def initialize(*cells)
    @cells=cells
  end

  def number_of_cells
    OpenStruct.new(number: @cells.size)
  end

  def add_cells(*cells)
    cells.each do |cell|
      @cells << cell unless is_a_repeated_cell?(cell)
    end
  end

  private
  def is_a_repeated_cell?(another_cell)
    @cells.any?{ |cell| cell.on_same_position?(another_cell.position) }
  end
end
