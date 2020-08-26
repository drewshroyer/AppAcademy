class CreatePoem < ActiveRecord::Migration[5.2]
  def change
    create_table :poems do |t|
      t.string :title, null:false 
      t.string :stanza, null:false
      t.boolean :complete, null:false
      t.integer :author_id, null:false
      
    end
  end
end
