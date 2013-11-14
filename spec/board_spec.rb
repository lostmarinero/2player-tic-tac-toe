require_relative 'spec_helper.rb'

describe Board do
  
  before :each do
    @board = Board.new
  end  

  describe '#new' do
    it 'takes no parameter and returns a board object' do
      expect(@board).to be_an_instance_of(Board)
    end

    it 'has 9 spaces on the board' do
      expect(@board.spaces.length).to eq(9)
    end

    it 'has empty spaces' do
      expect(@board.spaces[1]).to eq(nil)
      expect(@board.spaces[9]).to eq(nil)
    end

  end

end