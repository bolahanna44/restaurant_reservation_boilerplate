class Api::V1::RestaurantSerializer < ActiveModel::Serializer
  attributes :id, :name, :cuisines, :phone, :email, :location, :opening_hours
end
