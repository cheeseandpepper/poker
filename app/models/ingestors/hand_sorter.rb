module Ingestors
  class HandSorter
    SORT_ORDER = %w(A K Q J T
      9 8 7 6 5 4 3 2).freeze

    attr_reader :hand
    attr_accessor :sorted_ranks, :sorted_suits

    def initialize(hand)
      @hand = hand
      @sorted_ranks = nil
      @sorted_suits = nil
    end

    def sort
      sorted_hand = sort_hand(hand)
      sort_ranks_and_suits(sorted_hand)
      
      sorted_hand
    end

    def sort_hand(hand)
      hand
        .chars
        .each_slice(2)
        .sort_by { |s| SORT_ORDER.index(s[0]) }
        .flatten
        .join
    end

    def sort_ranks_and_suits(sorted_hand)
      tuple = sorted_hand
        .chars
        .partition
        .with_index { |_, i| i.even? }

      self.sorted_ranks = tuple.first.join
      self.sorted_suits = tuple.last.join
    end
  end
end