class CreateComment < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :body, null: false
      t.integer :commenter_id, null: false
      t.integer :artwork_id, null: false
      t.timestamps
    end
    add_index :comments, :artwork_id
  end
end
