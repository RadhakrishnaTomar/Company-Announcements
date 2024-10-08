class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :commentable, polymorphic: true
  has_many :replies, class_name: "Comment", foreign_key: :parent_id, dependent: :destroy
  belongs_to :parent, class_name: "Comment", optional: true

  validates :content, presence: true

  def nested_replies
    replies.includes(:user).order(created_at: :asc)
  end
end

