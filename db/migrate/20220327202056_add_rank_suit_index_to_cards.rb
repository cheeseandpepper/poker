class AddRankSuitIndexToCards < ActiveRecord::Migration[7.0]
  def change
    add_index :cards, [:rank, :suit]
  end
end
