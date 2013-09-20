require 'rspec'
require_relative 'game'

describe Game do
  let(:game) { Game.new }
  it "is not nil" do
    expect(game).to_not be_nil
  end

  it "should have cells" do
    expect(game.cells).to be_a Array
  end

  let(:game_initialized){Game.new([double(:cell), double(:cell)])}
  
  it "initializes with an array of cells" do
    expect(game_initialized.cells[0]).to_not be_nil
  end
  
  describe '#tic' do
    
    it "should have a tic" do
      expect(game.tic).to_not be_nil
    end

    it "should call cell neighbors for each cell" do
      game_initialized.should_receive(:cell_neighbors).exactly(game_initialized.cells.length).times
      game_initialized.tic
    end
  end

  describe '#cell_neighbors' do
    let(:cell1) { double(:cell).stub_chain(:x, :y).and_return(0) }
    let(:cell2) { double(:cell).stub_chain(:x, :y).and_return(1) }
    let(:cell_hash1) { game_initialized.cell_neighbors(cell1) }
    let(:cell_hash2) { game_initialized.cell_neighbors(cell2) }

    it 'should be a method' do
      expect{ game.cell_neighbors }.to_not be_nil
    end

    it "should expect a cell as an argument" do
      expect{ game.cell_neighbors }.to raise_error
    end

    it "should return a hash" do
      expect(game_initialized.cell_neighbors(double(:cell))).to be_a Hash
    end
    
    context "there is no cell in memory in the given direction" do
      it "should return a new cell to the left" do
        expect(cell_hash1[:l].x).to be -1
        expect(cell_hash1[:l].y).to be  0
      end 

      it "should return a new cell to the right" do
        expect(cell_hash2[:r].x).to be 1 
        expect(cell_hash2[:r].y).to be 0
      end
    end

    context "there is a cell in memory in the given direction" do
      it "should return an existing cell to the up and right" do
        game = Game.new([cell2])
        expect(game.cell_neighbors(cell1)[:ur]).to be cell2
      end
    end
  end
end

describe Cell do
  let(:cell) { Cell.new(0,0) }
  it "is not nil" do
    expect(cell).to_not be_nil
  end

  it "should initialize with two coordinates" do
    expect{Cell.new}.to raise_error
  end

  it "should have an x-coordinate" do
    expect(cell.x).to eql 0
  end

  it "should have a y-coordinate" do
    expect(cell.y).to eql 0
  end

  it "should be alive or dead" do 
    expect(cell.alive).to_not be_nil
  end

  it "should intialize as dead" do
    expect(cell.alive).to eq(false)
  end

end