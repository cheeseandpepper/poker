module Ingestors
  class HandEvaluator
    attr_accessor :winner_id, :winning_hand_id, :p1, :p2
    
    def initialize(player_1_hand, player_2_hand)
      @p1 = Ingestors::HandSorter.new(player_1_hand).sort!
      @p2 = Ingestors::HandSorter.new(player_2_hand).sort!
    end

    def find_winner!
      if player_1_ref.rank < player_2_ref.rank
        self.winning_hand_id = player_1_ref.id
        self.winner_id       = 1
      else
        self.winning_hand_id = player_2_ref.id
        self.winner_id       = 2
      end  
    end

    def hands
      [player_1_hand, player_2_hand]
    end

    def player_1_ref
      HandReference.where(
        identifier:    p1.sorted_ranks,
        requires_suit: hand_requires_suit?(p1)
      ).first
    end

    def player_2_ref
      HandReference.where(
        identifier:    p2.sorted_ranks,
        requires_suit: hand_requires_suit?(p2)
      ).first
    end

    def player_1_hand
      @player_1_hand ||= {
        raw_string:        p1.hand.join,
        player_id:         1,
        hand_reference_id: player_1_ref.id,
        card_1_id:         Card.find_by_identifier(p1.hand[0]).id,
        card_2_id:         Card.find_by_identifier(p1.hand[1]).id,
        card_3_id:         Card.find_by_identifier(p1.hand[2]).id,
        card_4_id:         Card.find_by_identifier(p1.hand[3]).id,
        card_5_id:         Card.find_by_identifier(p1.hand[4]).id
      }
    end

    def player_2_hand
      @player_2_hand ||= {
        raw_string:        p2.hand.join,
        player_id:         2,
        hand_reference_id: player_2_ref.id,
        card_1_id:         Card.find_by_identifier(p2.hand[0]).id,
        card_2_id:         Card.find_by_identifier(p2.hand[1]).id,
        card_3_id:         Card.find_by_identifier(p2.hand[2]).id,
        card_4_id:         Card.find_by_identifier(p2.hand[3]).id,
        card_5_id:         Card.find_by_identifier(p2.hand[4]).id
      }
    end
    
    def hand_requires_suit?(hand)
      hand.sorted_suits.uniq.count == 1
    rescue
      false
    end
  end
end