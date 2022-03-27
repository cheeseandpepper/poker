require 'csv'

module DbSeeds
  class HandReferences < Base
    SORT_ORDER = %w(A K Q J T
      9 8 7 6 5 4 3 2).freeze
    class << self
      def execute!
        with_logging do
          hand_references = []
          CSV.foreach("/app/public/poker_hands.csv").with_index(1) do |row, i|
            #row is [7, 7, 7, 6, 6, FH]
            
            short_name = row.pop.strip
            long_name  = name_from_short_name(short_name)
            
            hand_references << {
              name:          long_name,
              short_name:    short_name,
              rank:          i,
              identifier:    identifier_from_row(row),
              requires_suit: requires_suit?(short_name)
            }
          end
          
          ActiveRecord::Base.transaction do
            HandReference.insert_all(hand_references)
          end
        end
      end

      private

      def identifier_from_row(row)
        # source data was a little dirty 
        row
          .join
          .gsub(' ', '')
          .chars
          .sort_by { |s| SORT_ORDER.index(s[0]) }
          .join
      end

      def name_from_short_name(short_name)
        {
          'RF' => 'Royal Flush',
          'SF' => 'Straight Flush',
          '4K' => 'Four of a Kind',
          'FH' => 'Full House',
          'F'  => 'Flush',
          'S'  => 'Straight',
          '3K' => 'Three of a Kind',
          '2P' => 'Two Pair',
          '1P' => 'One Pair',
          'HC' => 'High Card'
        }[short_name]
      end

      def requires_suit?(short_name)
        short_name.in?(['RF', 'SF', 'F'])
      end
    end
  end
end
