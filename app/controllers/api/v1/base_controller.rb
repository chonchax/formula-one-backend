# frozen_string_literal: true

class Api::V1::BaseController < ActionController::API
  include Pagy::Method
  before_action :authenticate_user!

  private

  def authenticate_user!
    header = request.headers["Authorization"]
    token = header&.split(" ")&.last
    return render_unauthorized unless token

    begin
      payload = Warden::JWTAuth::TokenDecoder.new.call(token)
      @current_user = User.find(payload["sub"])
    rescue StandardError
      render_unauthorized
    end
  end

  def current_user
    @current_user
  end

  def render_unauthorized
    render json: { error: "You need to sign in or sign up before continuing." }, status: :unauthorized
  end
end
