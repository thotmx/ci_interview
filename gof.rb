class Cell
  def initialize
    @alive = true
  end

  def alive?
    @alive
  end
end

class DirtyTester

  def test_cell_creation
    cell = Cell.new
    raise "Fail" if cell.nil?
  end

  def create_cell_alive
    cell = Cell.new
    raise "Fail" unless cell.alive?
  end

  def run
    methods(false).each do |method|
      send(method) unless method == :run
    end
  end
end

DirtyTester.new.run
