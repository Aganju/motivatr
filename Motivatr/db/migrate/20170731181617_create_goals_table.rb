class CreateGoalsTable < ActiveRecord::Migration[5.1]
  def change
    create_table :goals do |t|
      t.text :body, null: false
      t.integer :user_id, null: false

      t.timestamps
    end
  end
end
