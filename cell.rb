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
  end

  def count_neighbours
    @neighbours.size
  end
end


