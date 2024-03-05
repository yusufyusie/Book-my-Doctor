class JsonWebToken
  def self.encode(payload)
    expiration = 30.days.from_now.to_i
    JWT.encode(payload.merge(exp: expiration), ENV.fetch('DEVISE_JWT_SECRET_KEY', Rails.application.secret_key_base),
               'HS256')
  end

  def self.decode(token)
    JWT.decode(token, ENV.fetch('DEVISE_JWT_SECRET_KEY', Rails.application.secret_key_base), true,
               algorithm: 'HS256').first
  end
end
