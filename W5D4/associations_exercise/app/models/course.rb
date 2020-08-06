
# Table name: courses
#
#  id            :bigint           not null, primary key
#  name          :string
#  prereq_id     :integer
#  instructor_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null

class Course < ApplicationRecord
    validates :name, presence: true, uniqueness: true
    validates :prereq_id, presence: true
    validates :instructor_id, presence: true
   
    has_many :enrollments,
        primary_key: :id,
        foreign_key: :course_id,
        class_name: :Enrollment

    belongs_to :user,
        primary_key: :id,
        foreign_key: :instructor_id,
        class_name: :User
## the below method does not have a related has_many and while it is good practice to write them 
## in pairs it is not entirely necessary to have both methods defined 

    belongs_to :prerequisite, 
        primary_key: :id,
        foreign_key: :prereq_id,
        class_name: :Course
end
