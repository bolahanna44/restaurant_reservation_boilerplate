class Reservation < ApplicationRecord
  belongs_to :guest

  serialize :covers, Array

  validates :covers, presence: true
  validates :start_time, presence: true
end
