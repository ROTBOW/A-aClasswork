# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  username        :string           not null
#  session_token   :string           not null
#  password_digest :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord

    validates :username, :session_token, presence: true, uniqueness: true
    validates :password_digest, presence: true 
    validates :password, length: { minimum: 6 }, allow_nil: true 

    before_validation :ensure_session_token

    attr_reader :password

    has_many :subs,
        class_name: 'Sub',
        foreign_key: :moderator_id

    has_many :posts,
        class_name: 'Post',
        foreign_key: :author_id

    #SPIRE

    def self.find_by_credentials(username, password)
        user = User.find_by(username: username)
        user && user.is_password?(password) ? user : nil
    end

    def password=(password)
        self.password_digest = BCrypt::Password.create(password)
        @password = password
    end

    def is_password?(password)
        password_object = BCrypt::Password.new(self.password_digest)
        password_object.is_password?(password)
    end

    def reset_session_token!
        self.session_token = SecureRandom::urlsafe_base64
        self.save!
        self.session_token
    end

    def ensure_session_token
        self.session_token ||= SecureRandom::urlsafe_base64
    end

end
