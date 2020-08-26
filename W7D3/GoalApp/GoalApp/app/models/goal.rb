# == Schema Information
#
# Table name: goals
#
#  id         :integer          not null, primary key
#  visibility :string           not null
#  user_id    :integer
#  name       :string           not null
#
class Goal < ApplicationRecord

    validates :name, presence:true 
    validates :user_id, presence:true 
    validates :visibility, presence:true, inclusion: { in %w(public private), message: "%{visibility} is not valid" }

    belongs_to :user,
        primary_key: :id, 
        foreign_key: :user_id,
        class_name: :User

end
