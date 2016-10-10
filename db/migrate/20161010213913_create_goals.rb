class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.string :title, null: false
      t.text :details
      t.integer :user_id
      t.boolean :private, default: false, null: false
      t.boolean :completed, default: false, null: false

      t.timestamps null: false
    end
    add_index :goals, :user_id
  end
end
