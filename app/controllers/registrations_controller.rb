class RegistrationsController < ApplicationController

  skip_before_action :authenticate_token!
 def create
 if user_exists?(sign_up_params[:email])
  render json: { error: 'Email already exists. Please choose a different email!' }, status: :unprocessable_entity
 else
  user = User.new(sign_up_params)
 if user.save
  render json: { user: user, token: JsonWebToken.encode({ id: user.id }) }
 else
  render json: { error: "'Failed to create user. Check on input!" }, status: :unprocessable_entity
 end
 end
 end
 protected
 def user_exists?(email)
 User.exists?(email: email)
 end
 def sign_up_params
  params.require(:user).permit(:name, :email, :password_digest)
 # params.require(:user).permit(:name, :email, :password, :password_confirmation) 
end
 end