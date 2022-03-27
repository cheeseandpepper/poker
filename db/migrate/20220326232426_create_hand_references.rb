class CreateHandReferences < ActiveRecord::Migration[7.0]
  def change
    create_table :hand_references do |t|
      t.string    :name           # Full House
      t.string    :short_name     # FH
      t.integer   :rank           # 73 
      t.string    :identifier     # 'TTT44' <-- sorted by rank 
      t.boolean   :requires_suit  # false

      t.timestamps
    end
  end
end
