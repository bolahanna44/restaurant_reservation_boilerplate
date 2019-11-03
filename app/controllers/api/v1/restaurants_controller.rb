class Api::V1::RestaurantsController < Api::V1::ApplicationController
  def index
    render json: policy_scope(Restaurant), serialize_each: Api::V1::RestaurantSerializer
  end

  def create
    restaurant = Restaurant.new(restaurant_params)
    authorize restaurant

    if restaurant.save
      render json: restaurant
    else
      render json: { errors: restaurant.errors.full_messages.to_sentence }, status: :bad_request
    end
  end

  def show
    restaurant = load_restaurant

    if restaurant.present?
      render json: restaurant
    else
      render json: { errors: 'record not found' }, status: :bad_request
    end
  end

  def update
    restaurant = load_restaurant
    authorize restaurant

    if restaurant.update(restaurant_params)
      render json: restaurant
    else
      render json: { errors: restaurant.errors.full_messages.to_sentence }, status: :bad_request
    end
  end

  def destroy
    restaurant = load_restaurant
    authorize restaurant

    if restaurant.present? && restaurant.destroy
      head :ok
    else
      render json: {
        errors: restaurant.nil? ? 'record not found' : restaurant.errors.full_messages.to_sentence
      }, status: :bad_request
    end

  end

  private

  def load_restaurant
    Restaurant.find_by(id: params[:id])
  end

  def restaurant_params
    params.require(:restaurant).permit(:opening_hours, :cuisines, :location, :phone, :name, :user_id)
  end
end
