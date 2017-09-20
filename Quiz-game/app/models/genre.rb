class Genre < ApplicationRecord
    has_many :sub_genres , :dependent => :destroy
    has_many :leaderboard_genres ,:dependent => :destroy
    validates :name, presence: true
    validates_uniqueness_of :name
end
