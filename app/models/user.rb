class User < ApplicationRecord
  validates :name, presence: true
  validates :username, presence: true, uniqueness: true
  has_many :tweets, dependent: :destroy
  has_one_attached :avatar
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end