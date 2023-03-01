class Beast < ApplicationRecord
  belongs_to :user
  has_many :bookings

  has_many_attached :photos

  TAGS = %w[aquatic]

  validates :race, :danger_gauge, :tags, :price_per_day, presence: true
  validates :tags, inclusion: { in: TAGS }
end
