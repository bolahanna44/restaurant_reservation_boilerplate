class ReservationPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      @user.restaurant? && @user.restaurant_reservations ||
        @user.guest? && @user.reservations ||
        @user.admin? && Reservation.all
    end
  end

  def update?
    @record.user_id == @user.id || (@user.restaurants.pluck(:id).include? @record.id) || @user.admin?
  end

  def destroy?
    update?
  end

  def show?
    update?
  end
end
