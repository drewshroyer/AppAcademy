# == Schema Information
#
# Table name: shorten_urls
#
#  id         :bigint           not null, primary key
#  short_url  :string           not null
#  long_url   :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class ShortenUrl < ApplicationRecord
    validates :short_url, presence: true, uniqueness: true
    validates :long_url, presence: true

    belongs_to :submitter,
        primary_key: :id,
        foreign_key: :long_url,
        class_name: :User

    def self.random_code
        code = SecureRandom.urlsafe_base64(16)
        if self.exists?(code)
            ShortenUrl.random_code
        else; return code
        end
    end

    def self.create!(user, long_url)
        ShortenUrl.create (
            long_url: long_url
            short_url: ShortenUrl.random_code
        )
    end



end
