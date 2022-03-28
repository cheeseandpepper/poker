class Player < ApplicationRecord
  has_many :winning_games,
           class_name: 'Game',
           foreign_key: :winner_id
  
  def win_count
    Game.where(winner_id: id).count
  end

  def name
    "#{first_name} #{last_name}"
  end
end
