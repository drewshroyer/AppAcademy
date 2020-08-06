class CreateLocationsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :locations do |t|
      t.string :place, null: false # index here also 

      t.timestamps
    end

    create_table :bubbles do |t|
      t.string :body, null: false
      t.string :author_id, null: false  # foreign key!

      t.timestamps
    end

    add_index  :bubbles, :author_id
    add_index :locations, :place, unique: true

  end
end
