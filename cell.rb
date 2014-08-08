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

  def add_neighbour(*neighbours)
    neighbours.each do |neighbour|
      unless on_same_position?(neighbour.position) or is_a_repeated_neighbour?(neighbour)
        @neighbours << neighbour
      end
    end
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

  private

  def is_a_repeated_neighbour?(new_neighbour)
     @neighbours.any?{ |neighbour| neighbour.on_same_position?(new_neighbour.position) }
  end
end


