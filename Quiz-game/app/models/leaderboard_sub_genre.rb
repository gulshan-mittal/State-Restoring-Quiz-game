class LeaderboardSubGenre < ApplicationRecord
  belongs_to :user
  belongs_to :quize
  belongs_to :sub_genre
end
