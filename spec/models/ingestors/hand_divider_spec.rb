require 'rails_helper'

RSpec.describe Ingestors::HandDivider do
  let(:hand_string) { '8C TS KC 9H 4S 7D 2S 5D 3S AC' }
  let(:first_hand)  { '8CTSKC9H4S' }
  let(:second_hand) { '7D2S5D3SAC' }
  let(:subject)     { described_class.new(hand_string) }

  describe '#split' do
    it 'splits into instance variables' do
      expect {
        subject.split
      }.to change {
        subject.first_hand
      }.from('').to(first_hand)
      .and change {
        subject.second_hand
      }.from('').to(second_hand)
    end

    it 'returns splits and sorts' do
      instance = subject.split
      instance.instance_variables.each do |ivar|
        expect(instance.instance_variable_get(ivar)).to be_present
      end
    end
  end
end
