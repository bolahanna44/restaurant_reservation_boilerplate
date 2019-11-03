class Api::V1::ReservationSerializer < ActiveModel::Serializer
  attributes :id, :status, :covers, :start_time, :notes

  belongs_to :restaurant
  belongs_to :user
end
