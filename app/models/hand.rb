class Hand < ApplicationRecord
  belongs_to :player
  belongs_to :game

  has_one :hand_reference,
          foreign_key: :id
end
