class Review < ApplicationRecord
  belongs_to :venue
  belongs_to :user

  validates :rating, presence: true
end
