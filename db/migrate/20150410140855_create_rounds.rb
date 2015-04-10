class CreateRounds < ActiveRecord::Migration
  def change
    create_tables :rounds do |t|
      t.references :deck
      t.references :user

      t.timestamps
    end
  end
end
