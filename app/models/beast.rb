class Beast < ApplicationRecord
  belongs_to :user
  has_many :bookings

  TAGS = %w[aquatic flying scaler wings tetrapod anphibic shell feathures carnivorus giant violent humanoïd bug plant polymorph elemental immaterial]

  validates :race, :danger_gauge, :tags, :price_per_day, :name, :description, presence: true
  validates :tags, inclusion: { in: TAGS }
end
