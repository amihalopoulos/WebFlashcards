class CreateDecks < ActiveRecord::Migration
  def change
    create_table :decks do |t|
      t.string :topic, null: false
      t.references :user, null: false
      t.timestamps
    end
  end
end
