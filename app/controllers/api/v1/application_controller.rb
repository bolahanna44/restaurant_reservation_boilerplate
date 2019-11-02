class Api::V1::ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery

  include DeviseTokenAuth::Concerns::SetUserByToken
  before_action :authenticate_user!
end
