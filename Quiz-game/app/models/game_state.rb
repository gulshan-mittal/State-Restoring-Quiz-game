class GameState < ApplicationRecord
  belongs_to :user
  belongs_to :quize
end
