class Post < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_many :comments, as: :commentable, dependent: :destroy
  validates :image, presence: true
  validates :description, presence: true
end
