# == Schema Information
#
# Table name: comments
#
#  id           :bigint           not null, primary key
#  body         :string           not null
#  commenter_id :integer          not null
#  artwork_id   :integer          not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Comment < ApplicationRecord
    validates :body, presence: true
    validates :artwork_id, presence: true
    validates :commenter_id, presence: true
    
    belongs_to :commenter,
        primary_key: :id,
        foreign_key: :commenter_id,
        class_name: :User


    belongs_to :peice_of_art,
        primary_key: :id,
        foreign_key: :artwork_id,
        class_name: :Artwork
        
end
