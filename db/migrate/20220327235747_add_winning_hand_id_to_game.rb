class AddWinningHandIdToGame < ActiveRecord::Migration[7.0]
  def change
    add_column :games, :winning_hand_id, :integer
  end
end
