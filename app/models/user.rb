class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy

    validates :full_name, :address, presence: true
    validates :mobile_number, presence: true, numericality: { only_integer: true }, length: { is: 10 }
end
