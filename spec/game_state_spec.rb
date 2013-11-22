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

  describe '#check_for_winning_move' do
    before do
      game_state.current_game.stub(:board).and_return([1, 1, 0, 2, 2, 0, 0, 0, 0])
      game_state.stub(:current_turn).and_return(1)
    end

    # it 'checks the current board\'s state' do
    #   expect(game_state).to receive(:board_state)
    #   game_state.check_for_winning_move
    # end

    it 'receives the current turn' do
      game_state.check_for_winning_move(game_state.current_turn)
      expect(game_state).to have_received(:current_turn)
    end

    it 'check\'s if the computer can win' do
      expect(game_state.check_for_winning_move(game_state.current_turn)).to eq(true)
    end

    it 'sets the winning_move attribute' do
      game_state.check_for_winning_move(game_state.current_turn)
      expect(game_state.winning_move).to eq(2)
    end
  end

  describe '#next_move' do
    context 'when its the computer\'s turn' do
      before do
        game_state.current_game.board = [1, 0, 2, 2, 2, 1, 0, 0, 1]
        game_state.stub(:current_turn).and_return(1)
      end
        
      it 'registers game state' do
        expect(game_state.available_moves.count).to eq(3)
      end

      context 'with a winning move' do
        before do
          game_state.current_game.board = [0, 0, 0, 2, 2, 0, 1, 1, 0]
          # game_state.stub(:check_for_winning_move).and_return(8)
        end

        it 'check\'s for the winning move' do
          expect(game_state.check_for_winning_move(game_state.current_turn)).to have_received(1)
          game_state.next_move
        end

        it 'makes a move' do
          expect{ game_state.next_move }.to change{ game_state.available_moves.count }.from(5).to(4)
        end

        it 'win\'s the game' do
          game_state.next_move
          game_state.current_game.check_win(1)
          expect( game_state.current_game.winner ).to eq(1)
        end
      end

      context 'when the human has a winning move' do
        before { game_state.current_game.board = [1, 0, 0, 2, 2, 0, 0, 1, 0] }       

        it 'blocks the win' do
          pending
          # expect { game_state. }
        end
      end
    
    end
  end

  describe "#final_state_value" do

    context 'when player 1 has won' do
      it 'returns the value 1' do
        game_state.current_game.stub(:winner).and_return(1)
        expect(game_state.final_state_value).to eq(1)
      end
    end

    context 'when player 2 (computer) has won' do
      it 'returns the value -1' do
        game_state.current_game.stub(:winner).and_return(2)
        expect(game_state.final_state_value).to eq(-1)
      end
    end

    context 'when the game is a draw' do
      it 'returns the value 0' do
        game_state.current_game.stub(:draw?).and_return(true)
        expect(game_state.final_state_value).to eq(0)
      end
    end 

  end

  describe "#analyze_state" do
    
    context 'when the the game is completed' do
      
      before do
        game_state.current_game.stub(:finished?).and_return(true)
        game_state.current_game.stub(:winner).and_return(1)
      end

      it 'checks to see if the game_state is finished' do
        game_state.analyze_state
        expect(game_state.current_game).to have_received(:finished?)
      end

      it 'returns the final state value' do
        expect(game_state.analyze_state).to eq(1)
      end

    end

    context 'when the game is incomplete' do
      it 'calculates the route value' do
        pending
      end

      
    end

  end

end