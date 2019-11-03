class Api::V1::ReservationsController < Api::V1::ApplicationController

  def_param_group :reservation do
    param :notes, String, desc: 'guest notes'
    param :start_time, String, desc: 'reservation start time', required: true
    param :status, String, desc: 'status of the reservation', required: true
    param :covers, String, desc: 'table guests', required: true
    param :restaurant, Array, desc: 'restaurant data' do
      param :name, String, desc: 'restaurant name', required: true
      param :cuisines, String, desc: 'type of the restaurant', required: true
      param :phone, Integer, desc: 'restaurant phone', required: true
      param :location, String, desc: 'restaurant location', required: true
      param :opening_hours, String, desc: 'restaurant opening hours', required: true
    end
  end

  # Index
  api :GET, 'api/v1/reservations', 'show all reservations'
  returns array_of: :reservation, code: 200, desc: 'should return'
  def index
    render json: policy_scope(Reservation).includes(:restaurant, :user), serialize_each: Api::V1::ReservationSerializer
  end

  # Create
  api :POST, 'api/v1/reservations', 'create reservation'
  param :restaurant_id, Integer, desc: 'id of the restaurant reservation made for', required: true
  param :user_id, Integer, desc: 'id of the user made the reservation', required: true
  param :start_time, String, desc: 'time of the reservation', required: true
  param :covers, Array, desc: 'table guests', required: true
  param :notes, String, desc: 'guest notes'
  returns :reservation, code: 200, desc: 'should return'
  returns code: 404, desc: 'error creating reservation' do
    property :errors, String, desc: 'cause of the error', required: true
  end
  def create
    reservation = Reservation.new(reservation_params)

    if reservation.save
      render json: reservation
    else
      render json: { errors: reservation.errors.full_messages.to_sentence }, status: :bad_request
    end
  end

  # Show
  api :GET, 'api/v1/reservations/:id', 'show reservation'
  param :id, Integer, desc: 'id of the reservation to be retireived', required: true
  returns :reservation, code: 200, desc: 'should return'
  returns code: 401, desc: 'unauthorized access'
  def show
    load_reservation

    if @reservation.present?
      render json: @reservation
    else
      render json: { errors: 'record not found' }, status: :bad_request
    end
  end

  # Update
  api :PATCH, 'api/v1/reservations/:id', 'update reservation'
  param :id, Integer, desc: 'id of the reservation to be updated'
  param :start_time, String, desc: 'time of the reservation', required: true
  param :covers, Array, desc: 'table guests', required: true
  param :notes, String, desc: 'guest notes'
  returns :reservation, code: 200, desc: 'should return'
  returns code: 401, desc: 'unauthorized access'
  returns code: 404, desc: 'error updating reservation' do
    property :errors, String, desc: 'cause of the error', required: true
  end
  def update
    load_reservation

    if @reservation.update(reservation_params)
      render json: @reservation
    else
      render json: { errors: @reservation.errors.full_messages.to_sentence }, status: :bad_request
    end
  end

  # Destroy
  api :DELETE, 'api/v1/reservations/:id', 'delete reservation'
  param :id, Integer, desc: 'id of the reservation to be deleted'
  returns code: 200, desc: 'should return'
  returns code: 401, desc: 'unauthorized access'
  returns code: 404, desc: 'error destroying reservation' do
    property :errors, String, desc: 'cause of the error'
  end
  def destroy
    load_reservation

    if @reservation.present? && @reservation.destroy
      head :ok
    else
      render json: {
        errors: @reservation.nil? ? 'record not found' : @reservation.errors.full_messages.to_sentence
      }, status: :bad_request
    end
  end



  private

  def load_reservation
    @reservation = Reservation.find_by(id: params[:id])
    authorize @reservation
  end

  def reservation_params
    attributes = %i[start_time notes restaurant_id user_id]
    attributes.push(covers: [])
    params.require(:reservation).permit(attributes)
  end
end

