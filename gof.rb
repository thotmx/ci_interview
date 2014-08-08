class Cell
end


def test_cell_creation
  cell = Cell.new
  raise "Fail" if cell.nil?
end



test_cell_creation
