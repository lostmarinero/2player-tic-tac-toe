require_relative('spec_helper')

describe 'Game' do
  
  let(:game) { Game.new('Kevin', 'Bob') }

    context 'with no parameters' do
      it 'raises an error' do
        expect{Game.new}.to raise_error(ArgumentError)  
      end
    end

    context 'with valid parameters' do
      it 'returns a game object' do
        expect(game).to be_an_instance_of(Game)
      end

      context 'with the game\'s players' do 
        it 'has a first player' do
          expect(game.players[0]).to be_an_instance_of(Player)
        end

        it 'has a second player' do
          expect(game.players[1]).to be_an_instance_of(Player)
        end

      end

      it 'has a board' do
        expect(game.board).to be_an_instance_of(Array)
      end

      it 'starts the turns with at zero' do
        expect(game.turns).to eq(0)
      end

      it 'has no winner' do
        expect(game.winner).to eq(nil)
      end

    end

    describe '#open_spaces' do
      
      subject(:open_spaces) { game.open_spaces }
      
      context 'with all spaces available' do
        it 'returns an array of indexes' do
          expect(open_spaces).to be_an_instance_of(Array)
        end

        it 'returns 9 available spaces' do
          expect(open_spaces.length).to eq(9)
        end

      end

      context 'with 4 spaces available' do
        it 'returns 4 available spaces' do
          game.board  = [1 , 1, 2, 2, 1, 0, 0, 0, 0]
          expect(game.open_spaces.length).to eq(4)
        end
      end
      
      context 'with no available spaces' do
        it 'returns an empty array' do
          game.board = [1, 1, 1, 1, 2, 2, 2, 2, 1]
          expect(game.open_spaces.length).to eq(0)
        end
      end

    end

end