class Planet < ApplicationRecord
  belongs_to :user
  has_many :reservations
  validates :name, uniqueness: true, presence: true
  validates :description, presence: true
  validates :price, persence: true
end
