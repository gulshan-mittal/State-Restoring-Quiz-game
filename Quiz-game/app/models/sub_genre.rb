class SubGenre < ApplicationRecord
  belongs_to :genre
  has_many :quizes , :dependent => :destroy
  has_many :leaderboard_sub_genres ,:dependent => :destroy
  validates :name, presence: true
  validates_uniqueness_of :name
end
