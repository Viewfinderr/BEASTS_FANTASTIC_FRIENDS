class Beast < ApplicationRecord
  belongs_to :user
  has_many :bookings

  TAGS = %w[aquatic]

  validates :race, :danger_gauge, :tags, :price_per_day, :address, presence: true
  validates :tags, inclusion: { in: TAGS }

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
