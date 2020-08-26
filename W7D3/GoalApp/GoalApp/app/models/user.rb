# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#
class User < ApplicationRecord

    has_many :goals,
        primary_key: :id, 
        foreign_key: :user_id,
        class_name: :Goal

    def find_by_credentials(username, password)
        user = User.find_by(username: username)
        return nil unless user && user.is_password?(password)
        user
    end

    def is_password?(password)
        @password = password
       self.password_digest = BCrypt::Password.create(password)
    end

    def generate_session_token 
        SecureRandom::urlsafe_base64
    end

    validates :password, length: { minimum: 6, allow_nil: true}
    validates :password_digest,  presence: true
    validates :session_token, presence: true, uniqueness:true 
    validates :username, presence: true, uniqueness:true 

    attr_reader :password

    def password=(password)
        bcrypt_password = BCrypt::Password.new(password_digest)
        bcrypt_password.is_password?(password)
    end

    def ensure_session_token 
        self.session_token ||= self.class.generate_session_token
    end

    def reset_session_token 
        self.session_token = self.class.generate_session_token
        self.save!
        self.session_token
    end
end
