require 'rails_helper'

RSpec.describe ReservationPolicy, type: :policy do
  let(:user) { User.new }

  subject { described_class }

  shared_examples "show" do
    permissions :show? do
      it 'grant access if reservation belong to that user' do
        user = create(:guest_user)
        restaurant = create(:restaurant)
        reservation = create(:reservation, user: user, restaurant: restaurant)
        expect(subject).to permit(user, reservation)
      end

      it 'deny access if reservation doesnt belong to the user' do
        restaurant = create(:restaurant)
        reservation = create(:reservation, user: create(:guest_user), restaurant: restaurant)
        expect(subject).not_to permit(create(:guest_user), reservation)
      end
    end
  end



  permissions :update? do
    it_behaves_like "show"
  end

  permissions :destroy? do
    it_behaves_like "show"
  end
end
