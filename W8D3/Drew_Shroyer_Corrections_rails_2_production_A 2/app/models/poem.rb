# == Schema Information
#
# Table name: poems
#
#  id        :bigint           not null, primary key
#  title     :string           not null
#  stanzas   :string           not null
#  complete  :boolean          not null
#  author_id :integer          not null
#
class Poem < ApplicationRecord

    validates :title, presence:true 
    validates :stanzas, presence:true 
    validates :complete, inclusion: {in: [true, false]}

    belongs_to :author,
        primary_key: :id,
        foreign_key: :author_id,
        class_name: :User
end
