require 'rails_helper'

RSpec.describe Ingestors::HandWinner do
  let(:game_string) { '8C TS KC 9H 4S 7D 2S 5D 3S AC' }
  let(:ingestor)    { Ingestors::HandDivider.new(game_string).split }
  let(:subject)     { described_class.new(ingestor) }

  #in lieu of factorybot etc
  let(:mock_ref_1) do
    OpenStruct.new(rank: 10)
  end

  let(:mock_ref_2) do
    OpenStruct.new(rank: 2)
  end
  
  before do
    allow(subject).to receive(:player_1_ref).and_return(mock_ref_1)
    allow(subject).to receive(:player_2_ref).and_return(mock_ref_2)
  end
  
  describe '#find_winner' do
    it 'sets the winner_id' do      
      expect {
        subject.find_winner
      }.to change {
        subject.winner_id
      }.from(nil).to(2)
    end
  end
end
