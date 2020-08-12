class Artwork < ActiveRecord::Migration[5.2]
  def change
     create_table :artworks do |t|
        t.string :title, null: false, unique: true
        t.integer :artist_id, null: false
        t.string :image_url, null: false, unique: true
    end
      add_index :artworks, :artist_id
  end
end
