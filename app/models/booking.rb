class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :beast

  before_validation :set_status

  validates :start_date, :end_date, :status, presence: true

  scope :declined, -> { where(status: "declined") }
  scope :accepted, -> { where(status: "accepted") }
  scope :canceled, -> { where(status: "canceled") }
  scope :pending, -> { where(status: "pending") }

  scope :current, -> { where.not(status: ["declined", "canceled", "accepted"]) }



  private

  def set_status
    status.nil? ? self.status = "pending" : self.status
  end
end
