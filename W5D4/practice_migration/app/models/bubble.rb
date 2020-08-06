# == Schema Information
#
# Table name: bubbles
#
#  id         :bigint           not null, primary key
#  body       :string           not null
#  author_id  :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Bubble < ApplicationRecord


end
