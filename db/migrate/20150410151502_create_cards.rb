class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :term, null: false
      t.string :description, null: false
      t.references :deck, null: false
      t.timestamps
    end
  end
end
