class Api::V1::ApplicationController < ActionController::Base
  include Pundit
  skip_before_action :verify_authenticity_token

  include DeviseTokenAuth::Concerns::SetUserByToken
  before_action :authenticate_user!

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized
    render json: { errors: 'not authorized' }, status: :unauthorized
  end
end
