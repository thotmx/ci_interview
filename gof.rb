class Cell
  def initialize
    @alive = true
  end

  def alive?
    @alive
  end
end

class DirtyTester

  def self.test_cell_creation
    cell = Cell.new
    raise "Fail" if cell.nil?
  end

  def self.create_cell_alive
    cell = Cell.new
    raise "Fail" unless cell.alive?
  end

end

DirtyTester.test_cell_creation
DirtyTester.create_cell_alive
