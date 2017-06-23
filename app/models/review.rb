class Review < ApplicationRecord
  belongs_to :venue
  belongs_to :user
  has_many :votes

  validates :rating, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5}

  def score
    self.votes.where(upvote: true).count - self.votes.where(upvote: false).count
  end
end
