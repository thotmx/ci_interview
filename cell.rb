require 'ostruct'

class Cell
  def initialize
    @alive = true
    @neighbours = []
  end

  def alive?
    @alive
  end

  def die
    @alive = false
    self
  end

  def position
    OpenStruct.new(column: 0, row: 0)
  end

  def count_neighbours
    OpenStruct.new(number: @neighbours.size)
  end

  def add_neighbour(*neighbour)
    @neighbours += neighbour
  end

  def tic
    if count_neighbours.number < 3
      die
    elsif count_neighbours.number > 3
      die
    else
      @alive = true
    end
  end
end


