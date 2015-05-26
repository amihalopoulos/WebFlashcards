class CreateGuesses < ActiveRecord::Migration
  def change
    create_table :guesses do |t|
      t.references :user, null: false
      t.references :card, null: false
      t.references :round, null: false
      t.string :user_input, null: false
      t.timestamps
    end
  end
end
