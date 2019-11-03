require 'rails_helper'

RSpec.describe Api::V1::RestaurantsController, type: :controller do
  describe "index" do
    auth_user 'admin_user'
    it 'should return restaurants' do
      create(:restaurant)
      create(:restaurant)
      get :index
      res = JSON.parse(response.body)
      expect(res.length).to eq(2)
    end
  end

  describe "show" do
    auth_user 'admin_user'
    it 'should return restaurant' do
      restaurant = create(:restaurant)
      get :show, params: { id: restaurant.id }
      res = JSON.parse(response.body)
      expect(res.dig('id')).to eq(restaurant.id)
    end
  end

  describe "update" do
    auth_user 'admin_user'
    it 'should update restaurant data' do
      restaurant = create(:restaurant, name: 'KFC')
      patch :update, params: { id: restaurant.id, restaurant: { name: 'Mac' } }
      res = JSON.parse(response.body)
      expect(res.dig('name')).to eq('Mac')
    end
  end

  describe "create" do
    auth_user 'admin_user'
    it 'should create restaurant' do
      post :create, params: { restaurant: { name: 'Mac', user_id: create(:user).id, location: 'UAE', opening_hours: '9 AM', cuisines: 'fast food' } }
      res = JSON.parse(response.body)
      expect(res.dig('name')).to eq('Mac')
    end
  end

  describe "destroy" do
    auth_user 'admin_user'
    it 'should delete restaurant' do
      restaurant = create(:restaurant)
      delete :destroy, params: { id: restaurant.id }
      expect(response).to have_http_status(:ok)
    end
  end
end
