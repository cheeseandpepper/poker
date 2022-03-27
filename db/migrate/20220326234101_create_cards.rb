class CreateCards < ActiveRecord::Migration[7.0]
  def change
    create_table :cards do |t|
      t.string     :rank
      t.string     :suit
      t.integer    :sort_value
      t.string     :name

      t.timestamps
    end
  end
end
