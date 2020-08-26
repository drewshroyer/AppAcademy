class CreateGoals < ActiveRecord::Migration[5.2]
  def change
    create_table :goals do |t|
      t.string :visibility, null:false
      t.integer :user_id
    end
    add_index :goals, :user_id
  end
end
