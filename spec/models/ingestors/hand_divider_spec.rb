require 'rails_helper'

RSpec.describe Ingestors::HandDivider do
  let(:hand_string) { '8C TS KC 9H 4S 7D 2S 5D 3S AC' }
  let(:first_hand)  { '8TK94' }
  let(:second_hand) { '7253A' }
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

    it 'returns the split array' do
      expect(subject.split).to eq([first_hand, second_hand])
    end
    
    context 'with sort option' do
      let(:sorted_1) { 'KT984' }
      let(:sorted_2) { 'A7532' }

      it 'returns a sorted array' do
        expect(subject.split(true)).to eq([sorted_1, sorted_2])
      end
    end 
  end
end
