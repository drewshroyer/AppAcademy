# == Schema Information
#
# Table name: cat_rental_requests
#
#  id         :bigint           not null, primary key
#  cat_id     :integer          not null
#  start_date :date             not null
#  end_date   :date             not null
#  status     :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class CatRentalRequest < ApplicationRecord

    validates :cat_id, :start_date. :end_date, presence: true

    validates :status, inclusion: { in: %w(PENDING APPROVED DENIED),
    message: "%{value} is not a valid status" }

    validate :overlapping_requests

    belongs_to :cat,
        primary_id: :id,
        foreign_key: :cat_id,
        class_name: :Cat

    def overlapping_requests

        CatRentalRequest
        .joins(:cats)
        .where('cats.id = cat_rental_requests.cat_id')
        .where('start')
        
    end

    
end
