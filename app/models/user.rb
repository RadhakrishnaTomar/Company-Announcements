class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts
  has_many :comments, dependent: :destroy
  has_many :profile_comments, as: :commentable, class_name: 'Comment', dependent: :destroy
  validates :full_name, :address, presence: true
  validates :mobile_number, presence: true, numericality: { only_integer: true }, length: { is: 10 }
end
