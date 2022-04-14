# module Ingestors
#   class HandDivider
#     attr_accessor :first_ranks,        :second_ranks,
#                   :first_ranks_sorted, :second_ranks_sorted,
#                   :first_suits,        :second_suits,
#                   :first_suits_sorted, :second_suits_sorted,
#                   :first_hand,         :second_hand,
#                   :first_hand_sorted,  :second_hand_sorted

    
    
#     attr_accessor :two_hand_array
    
#     def initialize(two_hand_array)
#       @two_hand_array = two_hand_array
#     end

#     def split
#       two_hand_string.chars.each do |char|
#         if should_parse_first_hand?
#           handle_rank_or_suit(char, first_ranks, first_suits, first_hand) 
#         else
#           handle_rank_or_suit(char, second_ranks, second_suits, second_hand) 
#         end
#       end

#       apply_first_sorts(self.first_hand)
#       apply_second_sorts(self.second_hand)
      
#       self
#     end

#     def first_suits_required?
#       first_suits.chars.uniq.size == 1
#     end

#     def second_suits_required?
#       second_suits.chars.uniq.size == 1
#     end

#     def apply_first_sorts(first_hand)
#       sorter = Ingestors::HandSorter.new(first_hand)
#       self.first_hand_sorted  = sorter.sort
#       self.first_ranks_sorted = sorter.sorted_ranks
#       self.first_suits_sorted = sorter.sorted_suits
#     end

#     def apply_second_sorts(second_hand)
#       sorter = Ingestors::HandSorter.new(second_hand)
#       self.second_hand_sorted  = sorter.sort
#       self.second_ranks_sorted = sorter.sorted_ranks
#       self.second_suits_sorted = sorter.sorted_suits
#     end


#     private

#     def should_parse_first_hand?
#       first_ranks.size < 5 || first_suits.size < 5
#     end

#     def handle_rank_or_suit(char, ranks, suits, hand)
#       if char =~ /[0-9TJQKA]/
#         hand << char
#         ranks << char
#       elsif char =~ /[CDHS]/
#         hand << char
#         suits << char
#       end 
#     end
#   end
# end