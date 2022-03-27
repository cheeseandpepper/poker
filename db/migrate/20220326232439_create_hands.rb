class CreateHands < ActiveRecord::Migration[7.0]
  def change
    create_table :hands do |t|
      t.string   :raw_string
      t.integer  :game_id
      t.integer  :player_id
      t.integer  :hand_reference_id

      # doing this for now,
      # thinking about a refactor
      
      t.integer  :card_1_id
      t.integer  :card_2_id
      t.integer  :card_3_id
      t.integer  :card_4_id
      t.integer  :card_5_id
      
      t.timestamps
    end
  end
end
