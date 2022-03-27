module Ingestors
  class HandWinner
    attr_reader   :ingestor
    attr_accessor :winner_id
    def initialize(ingestor)
      @ingestor  = ingestor
    end

    def find_winner
      if player_1_ref.rank < player_2_ref.rank
        self.winner_id = 1 #only 2 players in the universe
        'player_1'
      else
        self.winner_id = 2
        'player_2' 
      end
    rescue => e
      binding.pry
    end

    def hands
      [player_1_hand, player_2_hand]
    end

    def player_1_ref
      HandReference.where(
        identifier:    ingestor.first_ranks_sorted,
        requires_suit: ingestor.first_suits_required?
      ).first
    end

    def player_2_ref
      HandReference.where(
        identifier:    ingestor.second_ranks_sorted,
        requires_suit: ingestor.second_suits_required?
      ).first
    end

    def player_1_hand
      @player_1_hand ||= {
        raw_string:        ingestor.first_hand,
        player_id:         1,
        hand_reference_id: player_1_ref.id,
        card_1_id:         first_hand_ids[0],
        card_2_id:         first_hand_ids[1],
        card_3_id:         first_hand_ids[2],
        card_4_id:         first_hand_ids[3],
        card_5_id:         first_hand_ids[4]
      }
    end

    def player_2_hand
      @player_2_hand ||= {
        raw_string:        ingestor.second_hand,
        player_id:         2,
        hand_reference_id: player_2_ref.id,
        card_1_id:         second_hand_ids[0],
        card_2_id:         second_hand_ids[1],
        card_3_id:         second_hand_ids[2],
        card_4_id:         second_hand_ids[3],
        card_5_id:         second_hand_ids[4]
      }
    end

    def first_hand_ids
      lookups = ingestor.first_hand.chars.each_slice(2).to_a
      
      lookups.map do |pair|
        Card.where(rank: pair[0], suit: pair[1]).first.id
      end
    end

    def second_hand_ids
      lookups = ingestor.second_hand.chars.each_slice(2).to_a
      
      lookups.map do |pair|
        Card.where(rank: pair[0], suit: pair[1]).first.id
      end
    end
  end
end