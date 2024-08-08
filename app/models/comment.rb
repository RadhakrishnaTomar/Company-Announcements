class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post, optional: true
  has_many :replies, class_name: 'Comment', foreign_key: 'parent_id', dependent: :destroy
  belongs_to :parent, class_name: 'Comment', optional: true

  validates :content, presence: true

  def self.nested_comments
    where(parent_id: nil)
  end
end

