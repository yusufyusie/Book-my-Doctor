# class ApplicationController < ActionController::API
#   attr_reader :current_user
#  protected :current_user
#   before_action :authenticate_token!
# #  private
#  def authenticate_token!
#   header = request.headers['Authorization']
#   header = header.split.last if header
#  begin
#  @payload = JsonWebToken.decode(header)
#  puts "Decoded payload: #{@payload}"
#  @current_user = User.find(@payload['sub'])
#  puts "current_user: #{@current_user}"
#  rescue JWT::ExpiredSignature
#   render json: { error: 'your authentication token is expired' }
#  rescue JWT::DecodeError
#   render json: { error: 'Incorrect authentication token' }
#  end
#  end

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
 @current_user = User.find(@payload['id'])
 puts "current_user: #{@current_user}"
 rescue JWT::ExpiredSignature
  render json: { error: 'your authentication token is expired' }
 rescue JWT::DecodeError
  render json: { error: 'Incorrect authentication token' }
 end
 end
 end

