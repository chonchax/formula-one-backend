# frozen_string_literal: true

class Api::V1::SessionsController < Devise::SessionsController
  respond_to :json

  def create
    user = User.find_for_database_authentication(email: params.dig(:user, :email))
    if user&.valid_password?(params.dig(:user, :password))
      token = Warden::JWTAuth::UserEncoder.new.call(user, :user, nil).first
      render json: { token: token, user: user.as_json(only: [ :id, :email, :created_at ]) }, status: :ok
    else
      render json: { error: "Invalid email or password" }, status: :unauthorized
    end
  end

  def destroy
    render json: { message: "Logged out" }, status: :ok
  end
end
