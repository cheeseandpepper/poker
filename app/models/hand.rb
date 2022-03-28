class Hand < ApplicationRecord
  alias_attribute :reference, :hand_reference

  belongs_to :player
  belongs_to :game

  has_one :hand_reference,
          primary_key: :hand_reference_id,
          foreign_key: :id

  delegate :name,
           :rank, 
           to: :hand_reference

  def cards
    #could probably be done w association
    Card.where(id: card_ids).in_deal_order(card_ids)
  end
  
  def card_ids
    [
      :card_1_id,
      :card_2_id,
      :card_3_id,
      :card_4_id,
      :card_5_id
    ].map { |cid| self.send(cid) } 
  end

  def winner?
    game.winner_id == player_id
  end
end
