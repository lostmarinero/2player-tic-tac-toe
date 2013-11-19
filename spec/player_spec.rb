require_relative('spec_helper')

describe Player do
   let(:player) { Player.new('Jaime', 1) }

  describe '#new' do
  
    context 'with no parameters' do
      it 'returns an error' do
        expect{ Player.new }.to raise_error(ArgumentError)
      end
    end
  
    context 'with valid parameters' do
      it 'returns a player object' do
        expect(player).to be_an_instance_of(Player)
      end

      it 'returns the correct name' do
        expect(player.name).to eq('Jaime')
      end

      it 'has an id' do
        expect(player.id).to eq(1)
      end
    
    end

  end

end