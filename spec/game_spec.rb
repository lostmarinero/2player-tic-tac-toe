require_relative('spec_helper')

describe 'Game' do
  
  describe '#new' do
    before :each do
      @game = Game.new('Kevin', 'OtherKevin')
    end

    context 'with no parameters' do
      it 'raises an error' do
        expect{Game.new}.to raise_error(ArgumentError)  
      end
    end

    context 'with valid parameters' do
      it 'returns a game object' do
        expect(@game).to be_an_instance_of(Game)
      end

      it 'has a player1' do
        expect(@game.player1).to be_an_instance_of(Player)
      end

      it 'has a player2' do
        expect(@game.player2).to be_an_instance_of(Player)
      end

      it 'has a board' do
        expect(@game.board).to be_an_instance_of(Board)
      end

    end
  
  end


end