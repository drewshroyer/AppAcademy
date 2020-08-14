class Updatecats < ActiveRecord::Migration[5.2]
  def change
    change_column :cat_rental_requests, :status, :string, :default => "PENDING"
  end
end
