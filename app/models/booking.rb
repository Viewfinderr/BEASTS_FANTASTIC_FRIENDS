class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :beast

  before_validation :set_status

  private

  def set_status
    self.status = "pending"
  end
end
