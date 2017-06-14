class Venue < ApplicationRecord
  has_many :reviews
  validates :name, presence: true
  validates :location, presence: true
  validates :ages, presence: true
  validates :capacity, presence: true, numericality: true
end
