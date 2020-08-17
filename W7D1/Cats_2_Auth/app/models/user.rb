
class User < ApplicationRecord

    validates :user_name, presence:true, uniqueness:true 
    validates :session_token, presence:true, uniqueness:true 
    validates :password_digest, presence: { message: 'Password can\'t be blank'}
    validates :password, length: { minimum: 6, allow_nil: true }

    before_validation :ensure_session_token #what does this line mean? 

    attr_reader :password

    def reset_session_token!
        self.session_token = self.class.generate_session_token
        self.save!
        self.session_token
    end

    def self.find_by_credentials(user_name, password)
        user = User.find_by(user_name: user_name)
        return nil unless user && user.is_password?(password)
        user
    end

    def self.generate_session_token
        SecureRandom::urlsafe_base64
    end

    def password=(password)
        @password = password
        self.password_digest = BCrypt::Password.create(password)
    end
    
    def is_password?(password)
        bcrypt_password = BCrypt::Password.new(self.password_digest)
        bcrypt_password.is_password?(password)
    end

    def ensure_session_token
        self.session_token ||= self.class.generate_session_token
    end

end