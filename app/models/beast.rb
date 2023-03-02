class Beast < ApplicationRecord
  belongs_to :user
  has_many :bookings

  TAGS = %w[aquatic flying scaler wings tetrapod anphibic shell feathures carnivorus giant violent humanoïd bug plant polymorph elemental immaterial]
  has_many_attached :photos

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  validates :race, :danger_gauge, :tags, :price_per_day, :adress, :name, :description, presence: true
  # validates :tags, inclusion: { in: TAGS }
  before_validation :shift_tags

  include PgSearch::Model
  pg_search_scope :search_by_name_race_tags,
    against: [ :name, :race, :tags ],
    using: {
      tsearch: { prefix: true }
    }

  private

  def shift_tags
    tags.shift if tags.first == ""
  end
end
