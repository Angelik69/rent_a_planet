class Reservation < ApplicationRecord
  belongs_to :planet
  belongs_to :user

  validates :start_date, presence: true
  validates :end_date, presence: true
  validate :date_order

  private

  def date_order
    return if start_date.blank? || end_date.blank?
    
    errors.add(:end_date, 'must be after start date') if end_date < start_date
  end
end
