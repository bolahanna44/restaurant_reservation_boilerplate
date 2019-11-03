class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant

  serialize :covers, Array

  validates :covers, presence: true
  validates :start_time, presence: true
end
