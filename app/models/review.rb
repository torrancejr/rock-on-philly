class Review < ApplicationRecord
  belongs_to :venue
  belongs_to :user
  has_many :votes

  validates :rating, presence: true, numericality: true

  def score
    self.votes.where(upvote: true).count - self.votes.where(upvote: false).count
  end
end
