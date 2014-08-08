require 'ostruct'

class Cell
  def initialize(column = 0, row = 0)
    @alive = true
    @neighbours = []
    @column = column
    @row = row
  end

  def alive?
    @alive
  end

  def die
    @alive = false
    self
  end

  def position
    OpenStruct.new(column: @column, row: @row)
  end

  def on_same_position?(new_position)
    position.column == new_position.column and position.row == new_position.row
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


