class Question < ApplicationRecord
  belongs_to :quize
  has_many :quiz_state ,:dependent => :destroy
end
