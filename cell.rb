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

  def add_neighbour(neighbour)
    @neighbours << neighbour
  end

  def tic
    if count_neighbours < 3
      die
    end
  end
end


