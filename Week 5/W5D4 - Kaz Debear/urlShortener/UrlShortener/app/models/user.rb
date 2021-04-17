class User < ApplicationRecord
    validates :email, presence: true, uniqueness: true
    validate :valid_email

    def valid_email
        errors[:email] << 'can\'t be nil' if self.email.nil?
        errors[:email] unless self.email.split('@').all? { |ele| ele.size > 0 }
    end
end