class User < ApplicationRecord
    has_many :quiz_states , :dependent => :destroy
    has_many :game_states , :dependent => :destroy
    has_many :leaderboard_genre , :dependent => :destroy
    has_many :leaderboard_sub_genre , :dependent => :destroy
    # before_save { self.email = email.downcase }
    validates :username,  presence: true ,length: { maximum: 50 }
    validates_uniqueness_of :username
    # VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true  

    has_secure_password
    validates :password, presence: true, length: { minimum: 6 }
    validates_uniqueness_of :email
    
end
