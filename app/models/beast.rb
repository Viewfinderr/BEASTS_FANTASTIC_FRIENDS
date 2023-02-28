class Beast < ApplicationRecord
  belongs_to :user
  has_many :bookings

  TAGS = %w[aquatic]

  validates :race, :danger_gauge, :tags, :price_per_day, presence: true
  validates :tags, inclusion: { in: TAGS }
end
