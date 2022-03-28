require 'rails_helper'

RSpec.describe Ingestors::HandWinner do
  let(:game_string) { '8C TS KC 9H 4S 7D 2S 5D 3S AC' }
  let(:ingestor)    { Ingestors::HandDivider.new(game_string).split }
  let(:subject)     { described_class.new(ingestor) }

  describe '#find_winner' do
    it 'sets the winner_id' do
      expect(subject.find_winner).to eq('player_2')
      expect(subject.winner_id).to eq(2)
    end
  end

  describe '#hands' do
    
  end

  describe '#player_1_ref' do
  end
end
