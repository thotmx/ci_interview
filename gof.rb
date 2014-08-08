class Cell
  def alive?
    false
  end
end


def test_cell_creation
  cell = Cell.new
  raise "Fail" if cell.nil?
end

def create_cell_alive
  cell = Cell.new
  raise "Fail" unless cell.alive?
end


test_cell_creation
create_cell_alive
