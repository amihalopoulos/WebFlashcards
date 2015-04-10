class CreateCards < ActiveRecord::Migration
  def change
    create_tables :cards do |t|
      t.string :question
      t.string :answer
      t.references :deck

      t.timestamps
    end
  end
end
