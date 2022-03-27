class AddIdentifierToCards < ActiveRecord::Migration[7.0]
  def change
    add_column :cards, :identifier, :string
    add_index :cards, :identifier
  end
end
