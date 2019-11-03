require 'rails_helper'

RSpec.describe Api::V1::ReservationsController, type: :controller do
  describe "index" do
    auth_user 'admin_user'
    it 'should return reservation' do
      create(:reservation)
      create(:reservation)
      get :index
      res = JSON.parse(response.body)
      expect(res.length).to eq(2)
    end
  end

  describe "show" do
    auth_user 'admin_user'
    it 'should return reservation' do
      reservation = create(:reservation)
      get :show, params: { id: reservation.id }
      res = JSON.parse(response.body)
      expect(res.dig('id')).to eq(reservation.id)
    end
  end

  describe "update" do
    auth_user 'admin_user'
    it 'should update reservation data' do
      reservation = create(:reservation)
      patch :update, params: { id: reservation.id, reservation: { covers: ['Daimen'], start_time: '9 AM' } }
      res = JSON.parse(response.body)
      expect(res.dig('covers')).to eq(['Daimen'])
    end
  end

  describe "create" do
    auth_user 'admin_user'
    it 'should create reservation' do
      post :create, params: { reservation: { restaurant_id: create(:restaurant).id, user_id: create(:user).id, covers: ['Daimen'], start_time: '9 AM' } }
      res = JSON.parse(response.body)
      expect(res.dig('covers')).to eq(['Daimen'])
    end
  end

  describe "destroy" do
    auth_user 'admin_user'
    it 'should delete reservation' do
      reservation = create(:reservation)
      delete :destroy, params: { id: reservation.id }
      expect(response).to have_http_status(:ok)
    end
  end
end
