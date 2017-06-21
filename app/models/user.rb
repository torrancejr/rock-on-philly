require 'uri'

class User < ApplicationRecord
  mount_uploader :profile_photo, AvatarUploader
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :reviews
  has_many :votes
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, format: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
  validates :admin, inclusion: { in: [true, false] }

  def editable_by?(user)
    user.admin?
  end

  def destroyable_by?(user)
    user.admin?
  end
end
