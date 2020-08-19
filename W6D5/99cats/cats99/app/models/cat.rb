# == Schema Information
#
# Table name: cats
#
#  id          :bigint           not null, primary key
#  birthday    :date             not null
#  color       :string           not null
#  name        :string           not null
#  sex         :string           not null
#  description :text             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Cat < ApplicationRecord
    validates :birthday, :description, :name, presence: true

    validates :color, inclusion: { in: %w(red blue green yellow purple beige),
        message: "%{value} is not a valid color" }

    validates :sex, inclusion: { in: %w(M F),
        message: "%{value} is not a valid sex" }    

    has_many :cat_rental_requests,
        primary_id: :id,
        foreign_key: :cat_id,
        class_name: :CatRentalRequest,    
        dependent: :destroy
end
