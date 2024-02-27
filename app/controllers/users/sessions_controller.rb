# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  include RackSessionsFix
  respond_to :json
    # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
   def new
     super
   end

  # POST /resource/sign_in
  #  def create
  #    super
  #  end

  # DELETE /resource/sign_out
   def destroy
     super
   end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  private

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password])
  end

  
  def respond_with(user, _opts = {})
  jwt_token = generate_jwt_token(user)
   puts "jwt:#{jwt_token}"
    render json: {
      status: { 
        code: 200, message: 'Logged in successfully.',
        data: { user: UserSerializer.new(user).serializable_hash[:data][:attributes], jwt: jwt_token}
      }
    }, status: :ok
  end

  def respond_to_on_destroy

    if request.headers['Authorization'].present?
      jwt_payload = JWT.decode(request.headers['Authorization'].split(' ').last, 
      Rails.application.credentials.devise_jwt_secret_key!).first
      user = User.find(jwt_payload['sub'])
    end
    
    if user
      render json: {
        status: 200,
        message: 'Logged out successfully.'
      }, status: :ok
    else
      render json: {
        status: 401,
        message: "Couldn't find an active session."
      }, status: :unauthorized
    end
  end

  private

  def generate_jwt_token(user)
    JWT.encode({ sub: user.id, exp: 30.minutes.to_i }, Rails.application.credentials.devise_jwt_secret_key)
  end
  
end
