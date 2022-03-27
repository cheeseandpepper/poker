class AddIdentifierIndexToHandReferences < ActiveRecord::Migration[7.0]
  def change
    add_index :hand_references, :identifier
  end
end
