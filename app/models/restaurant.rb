class Restaurant < ApplicationRecord
  has_many :reservations
  has_many :guests, through: :reservations

  validates :name, presence: true
  validates :location, presence: true
  validates :opening_hours, presence: true
  validates :cuisines, presence: true
  validates :email, presence: true
end
