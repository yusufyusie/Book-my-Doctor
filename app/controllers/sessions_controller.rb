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

 def destroy
  # Clear the JWT token from the client's browser storage
  # Assuming the JWT token is stored in local storage
  # You can adjust this based on how you store the token in your application
  cookies.delete(:jwt_token)
  render json: { message: 'Logout successful' }, status: :ok
end
 end