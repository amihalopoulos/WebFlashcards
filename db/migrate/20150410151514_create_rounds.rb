class CreateRounds < ActiveRecord::Migration
  def change
    create_table :rounds do |t|
      t.integer :num_correct, default: 0, null: false
      t.integer :num_incorrect, default: 0, null: false
      t.references :deck, null: false
      t.references :user, null: false
      t.timestamps
    end
  end
end
