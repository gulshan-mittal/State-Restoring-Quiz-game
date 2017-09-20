class LeaderboardGenre < ApplicationRecord
  belongs_to :user
  belongs_to :quize
  belongs_to :genre
end
