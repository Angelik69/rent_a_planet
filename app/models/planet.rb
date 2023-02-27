class Planet < ApplicationRecord
  belongs_to :user
  has_many :reservations
  has_one_attached :photo

  validates :name, uniqueness: true, presence: true
  validates :description, presence: true
  validates :price_per_night, presence: true
end
