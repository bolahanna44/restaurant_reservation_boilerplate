class Api::V1::ReservationsController < Api::V1::ApplicationController
  def index
    render json: Reservation.all, serialize_each: ReservationSerializer
  end

  def create
    reservation = Reservation.new(reservation_params)

    if reservation.save
      render json: reservation
    else
      render json: { errors: reservation.errors.full_messages.to_sentence }, status: :bad_request
    end
  end

  def show
    reservation = load_reservation

    if reservation.present?
      render json: reservation
    else
      render json: { errors: 'record not found' }, status: :bad_request
    end
  end

  def update
    reservation = load_reservation

    if reservation.update(reservation_params)
      render json: reservation
    else
      render json: { errors: reservation.errors.full_messages.to_sentence }, status: :bad_request
    end
  end

  def destroy
    reservation = load_reservation

    if reservation.present? && reservation.destroy
      head :ok
    else
      render json: {
        errors: reservation.nil? ? 'record not found' : reservation.errors.full_messages.to_sentence
      }, status: :bad_request
    end

  end

  private

  def load_reservation
    Reservation.find_by(id: params[:id])
  end

  def reservation_params
    params.require(:reservation).permit(:start_time, :covers)
  end
end

