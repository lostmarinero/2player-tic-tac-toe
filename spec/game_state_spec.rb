require_relative('spec_helper')

describe GameState do

  let(:game) { Game.new('Kevin', 'Bob') }
  let(:game_state) { GameState.new(game) }

  describe '#new' do

    context 'with valid parameters' do
      it 'creates a new game state object' do
        expect(game_state).to be_an_instance_of(GameState)
      end

      it 'has a current game' do
        expect(game_state.current_game).to be_an_instance_of(Game)
      end

      it 'has an array of avaialable moves' do
        expect(game_state.available_moves).to be_an_instance_of(Array)
      end

      it 'has a game board state' do
        expect(game_state.board_state).to be_an_instance_of(Array)
      end

      it 'has the current player\'s turn' do
        expect(game_state.current_turn).to eq(1)
      end
    end
  end

  # describe '#current' do
  #   it 'returns the current board' do
  #     expect(game_state.current).to be_an_instance_of(Array)
  #   end
  # end

  describe '#next_move' do
    context 'with valid parameters' do
      before do
        game_state.current_game.board = [1, 0, 2, 2, 2, 1, 0, 0, 1]
      end

      it 'takes the player\'s turn as input' do
        expect(game_state).to receive(:next_move)
        game_state.next_move
      end

      context 'when its the computer\'s turn' do
        # let(:game_state_new) { double('game_state', :available_moves => [1, 0, 2, 2, 2, 1, 0, 0, 1], :current_turn => 1)}
        
        it 'registers game state' do
          expect(game_state.available_moves.count).to eq(3)
        end

        it 'makes a move' do
          expect{ game_state.next_move }.to change{ game_state.available_moves.count }.from(3).to(2)
        end

      end
    end

    describe "#analyze_state" do
      it 'checks to see if the game_state is finished' do
        expect(game_state.current_game).to receive(:finished?).and_return(true)
      end
    end

  end

end