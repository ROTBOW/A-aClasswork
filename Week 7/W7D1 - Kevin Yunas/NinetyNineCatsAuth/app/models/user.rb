require 'bcrypt'

class User < ApplicationRecord
    validates :user_name, :password_digest, :session_token, presence: true
    validates :password, length: {minimum: 4}, allow_nil: true
    before_validation :ensure_token
    include BCrypt

    has_many :cats,
        primary_key: :id,
        foreign_key: :user_id,
        class_name: :Cat

    has_many :rental_requests,
        primary_key: :id,
        foreign_key: :user_id,
        class_name: :CatRentalRequest

    def reset_session_token!
        self.session_token = SecureRandom::urlsafe_base64
    end

    def password=(password)
        @password = password
        self.password_digest = Password.create(password)
    end

    def password
        @password
    end

    def is_password?(password)
        check = Password.new(self.password_digest)
        check.is_password?(password)
    end

    def self.find_by_credentials(user_name, password)
        user = User.find_by(user_name: user_name)

        if user && user.is_password?(password)
            return user
        else
            return nil
        end
    end

    def ensure_token
        self.session_token ||= SecureRandom::urlsafe_base64
    end
    
end
