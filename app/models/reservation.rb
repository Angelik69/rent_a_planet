class Reservation < ApplicationRecord
  belongs_to :planet
  belongs_to :user
  validates :start_date, presence: true
  validates :end_date, presence: true
end
