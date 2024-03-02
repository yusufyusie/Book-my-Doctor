class ApplicationController < ActionController::API
  attr_reader :current_user
 protected :current_user
  before_action :authenticate_token!
 private
 def authenticate_token!
  header = request.headers['Authorization']
  header = header.split.last if header
 begin
 @payload = JsonWebToken.decode(header)
 puts "Decoded payload: #{@payload}"
 @current_user = User.find(@payload['sub'])
 puts "current_user: #{@current_user}"
 rescue JWT::ExpiredSignature
  render json: { error: 'your authentication token is expired' }
 rescue JWT::DecodeError
  render json: { error: 'Incorrect authentication token' }
 end
 end

# def authenticate_token!
#   header = request.headers['Authorization']
#   header = header.split.last if header

#   unless header
#     header = session[:current_user].token if session[:current_user].present? && session[:current_user].token.present?
#   end

#   begin
#     puts "header: #{header}"
#     @decoded = JWT.decode(header, Rails.application.secret_key_base)[0]
#      @current_user = User.find(@decoded['id'])
#      puts "current_user: #{@current_user}"
#     session[:current_user] = @current_user
#   rescue JWT::DecodeError
#     render json: { error: true, message: 'OOps! you are not unauthorized 😁😁!' }, status: :unauthorized
#   end
# end

 end

