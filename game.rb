class Game 
  attr_accessor :cells

  def initialize(cells = [])
    self.cells = cells
  end

  def tic
    cells.each do |cell|
      cell_neighbors(cell)
    end
  end

  def cell_neighbors(cell)
    whammy = {l: Cell.new(-1,0), r: Cell.new(1, 0)}
    
    cells.each do |cell|
      
    end
  end
end

class Cell
  attr_reader :x, :y, :alive

  def initialize(x, y)
    @x = x
    @y = y
    @alive = false
  end
end