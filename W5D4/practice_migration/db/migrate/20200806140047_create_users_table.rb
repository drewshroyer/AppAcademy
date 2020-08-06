class CreateUsersTable < ActiveRecord::Migration[5.2]
  def change
    #table name should be lowercase and pluralized 
    # create columns INSIDE of the do block 

    create_table :users do |t|

      # t.data_type :name of column, do we allow null 
      # booleans will standalone - no symbols 

      t.string :name, null: false
      t.timestamps # creates two columns 
    end

    #specify the unique colums OUTSIDE the do block 
  end
end
