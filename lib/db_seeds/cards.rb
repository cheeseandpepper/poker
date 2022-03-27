module DbSeeds
  class Cards < Base
    class << self
      def execute!
        with_logging do
          ActiveRecord::Base.transaction do
            sorted_cards.each.with_index(1) do |card, i|
              Card.create!(
                rank:       card.first,
                suit:       card.last, 
                sort_value: i,
                name:       name_from_card(card)
              )
            end  
          end
        end
      end

      private

      def sorted_cards
        %w(
          AC AD AH AS
          KC KD KH KS
          QC QD QH QS
          JC JD JH JS
          TC TD TH TS
          9C 9D 9H 9S
          8C 8D 8H 8S
          7C 7D 7H 7S
          6C 6D 6H 6S
          5C 5D 5H 5S
          4C 4D 4H 4S
          3C 3D 3H 3S
          2C 2D 2H 2S
        )
      end

      def name_from_card(card)
        rank = rank_from_string(card.first)
        suit = suit_from_string(card.last)

        "#{rank} of #{suit}"
      end
      
      def rank_from_string(string)
        {
          'A' => 'Ace',
          'K' => 'King',
          'Q' => 'Queen',
          'J' => 'Jack',
          'T' => 'Ten',
          '9' => 'Nine',
          '8' => 'Eight',
          '7' => 'Seven',
          '6' => 'Six',
          '5' => 'Five',
          '4' => 'Four',
          '3' => 'Three',
          '2' => 'Two'
        }[string]
      end

      def suit_from_string(string)
        {
          'C' => 'Clubs',
          'D' => 'Diamonds',
          'H' => 'Hearts',
          'S' => 'Spades'
        }[string]
      end
    end
  end
end
