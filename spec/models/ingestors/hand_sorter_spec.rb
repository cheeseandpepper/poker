require 'rails_helper'

RSpec.describe Ingestors::HandSorter do
  let(:hand)    { '8TK94' }
  let(:sorted)  { 'KT984' }
  let(:subject) { described_class.new(hand) }

  describe '#sort' do
    it 'sorts from high to low card' do
    	expect(subject.sort).to eq(sorted)
    end
  end
end
