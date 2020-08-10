class UpdateUser < ActiveRecord::Migration[5.2]
  def change

    add_column :shorten_urls, :submitter_id, :integer

    add_index :shorten_urls, :submitter_id, unique: true 

  end
end
