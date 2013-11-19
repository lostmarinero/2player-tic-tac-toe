require_relative 'spec_helper.rb'

describe GameController do
  
  let(:game_controller) { GameController.new('Kevin') }


  describe '#new' do
    context 'with no parameters' do
      it 'raises an error' do
        expect{GameController.new}.to raise_error(ArgumentError)  
      end
    end

    context 'with valid parameters' do
      it 'takes no parameter and returns a board object' do
        expect(game_controller).to be_an_instance_of(GameController)
      end

      it 'has a current game' do
        expect(game_controller.current_game).to be_an_instance_of(Game)
      end

      it 'has a view' do
        expect(game_controller.view).to be_an_instance_of(View)
      end

    end

  end

end