class CreateShortenUrl < ActiveRecord::Migration[5.2]
  def change
    create_table :shorten_urls do |t|
      t.string :short_url, null:false
      t.string :long_url, null:false

      t.timestamps
    end

    add_index :shorten_urls, :short_url, unique: true
  end
end
