class User < ApplicationRecord
  has_many :planets
  has_many :reservations, through: :planets
  has_one_attached :avatar

  validates :avatar, presence: true
  validates :email, uniqueness: true, presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
