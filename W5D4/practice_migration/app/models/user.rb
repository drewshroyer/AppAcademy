# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#



#class name should be singular, non-pluralized, version of the table name 
# ApplicationRecord inherits from ActiveRecord:Base  giving us access to many nice methods 
# 
class User < ApplicationRecord

    validates :username, presence: true, uniqueness: true

end
