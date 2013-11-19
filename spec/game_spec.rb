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

      it 'has a first player' do
        expect(game.players[0]).to be_an_instance_of(Player)
      end

      it 'has a second player' do
        expect(game.players[1]).to be_an_instance_of(Player)
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

end