module Ingestors
  class HandSorter
    attr_reader :hand
    def initialize(hand)
      @hand = hand
    end

    def sort
      sort_order = %w(A K Q J T
      9 8 7 6 5 4 3 2)

      hand
        .chars
        .sort_by { |s| sort_order.index(s) }
        .join
    end
  end
end