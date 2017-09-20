class Quize < ApplicationRecord
  belongs_to :sub_genre
  has_many :questions , :dependent => :destroy
  has_many :game_state , :dependent => :destroy
  has_many :leaderboard_genre , :dependent => :destroy
  has_many :leaderboard_sub_genre , :dependent => :destroy
  validates :name, presence: true
  validates_uniqueness_of :name
end
