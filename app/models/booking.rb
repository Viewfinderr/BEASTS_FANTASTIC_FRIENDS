class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :beast

  before_validation :set_status

  validates :start_date, :end_date, :status, presence: true

  private

  def set_status
    self.status = "pending"
  end
end
