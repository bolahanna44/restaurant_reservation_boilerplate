class Reservation < ApplicationRecord
  belongs_to :user

  serialize :covers, Array

  validates :covers, presence: true
  validates :start_time, presence: true
end
