class SessionsController < ApplicationController
  skip_before_action :authenticate_token!
 def create
  user = User.find_by(email: params[:user][:email])
 if user&.authenticate(params[:user][:password])
  user_serializer = UserSerializer.new(user)
  render json: {
  user: user_serializer,
  token: JsonWebToken.encode({ sub: user.id })
  }, status: :ok
 else
  render json: {
  error: 'Incorrect email or password. Please try again!'
  }, status: :unauthorized
 end
 end


 end