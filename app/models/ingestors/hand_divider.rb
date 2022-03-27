module Ingestors
  class HandDivider
    attr_accessor :first_hand, :second_hand
    attr_reader   :two_hand_string
    def initialize(two_hand_string)
      @two_hand_string = two_hand_string
      @first_hand      = ''
      @second_hand     = ''
    end

    def split(sort=false)
      two_hand_string.chars.each do |char|
        if first_hand.length < 5
          first_hand << char if char =~ /[0-9TJQKA]/
        else
          second_hand << char if char =~ /[0-9TJQKA]/
        end
      end

      if sort
        [
          self.first_hand  = Ingestors::HandSorter.new(self.first_hand).sort,
          self.second_hand = Ingestors::HandSorter.new(self.second_hand).sort 
        ]
      else
        [self.first_hand, self.second_hand]  
      end
    end
  end
end