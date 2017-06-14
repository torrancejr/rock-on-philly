class Venue < ApplicationRecord
  validates :name, presence: true
  validates :location, presence: true
  validates :ages, presence: true
  validates :capacity, presence: true, numericality: true
end
