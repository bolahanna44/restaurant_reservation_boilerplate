class Restaurant < ApplicationRecord
  has_many :reservations
  belongs_to :user

  validates :name, presence: true
  validates :location, presence: true
  validates :opening_hours, presence: true
  validates :cuisines, presence: true
end
