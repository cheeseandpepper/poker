require 'rails_helper'
require_relative '../../../lib/db_seeds/base.rb'
require_relative '../../../lib/db_seeds/cards.rb'


RSpec.describe DbSeeds::Cards do
  describe '.execute!' do
    it 'seeds the db with cards' do
      expect {
        described_class.execute!
      }.to change {
        Card.count
      }.from(0).to(52)
    end
  end
end