class User < ApplicationRecord

self.find_by_credentials(username, password)
    user = User.find_by(username: username)
    return nil unless user && user.is_password?(password)
end

def is_password?(password)
    bcrypt_password = BCrypt::Password.new(self.password_digest)
    bcrypt_password.is_password?(password)
end

def  
end

validates :username 
validates :password
validates :password_digest 
validates :session_token

attr_reader :password

def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
end

def ensure_session_token
    :session_token ||= self.class.generate_session_token
end

def reset_session_token 
    self.session_token = self.class.generate_session_token
    self.save!
    self.session_token
end