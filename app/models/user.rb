class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, :last_name, presence: true

  has_many :bookings
  has_many :beasts
  has_many :booked_beasts, through: :bookings, source: :beast

  has_many :requested_bookings, through: :beasts, source: :bookings
end
