class Game < ApplicationRecord
  has_many :hands
  has_many :hand_references,
           through: :hands

  has_one :winning_hand,
          class_name: 'HandReference',
          primary_key: :winning_hand_id,
          foreign_key: :id

  has_one :winner,
          class_name: 'Player',
          foreign_key: :id,
          primary_key: :winner_id
  
end
