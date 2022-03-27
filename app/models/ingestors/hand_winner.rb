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
      return @first_hand_ids if @first_hand_ids
      i = 0
      identifiers = ingestor
        .first_hand
        .split do
          result = i.odd?
          i += 1
          result
        end

      @first_hand_ids ||= Card.where(identifier: identifiers).pluck(:id)
    end

    def second_hand_ids
      return @second_hand_ids if @second_hand_ids
      i = 0
      identifiers = ingestor
        .second_hand
        .split do
          result = i.odd?
          i += 1
          result
        end

      @second_hand_ids ||= Card.where(identifier: identifiers).pluck(:id)
    end
  end
end