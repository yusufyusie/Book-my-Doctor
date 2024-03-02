class JsonWebToken
  DEFAULT_SECRET_KEY = 'your_default_secret_key'.freeze
 def self.encode(payload)
  expiration = 300.hours.from_now.to_i
 JWT.encode(payload.merge(exp: expiration), ENV.fetch('DEVISE_JWT_SECRET_KEY', DEFAULT_SECRET_KEY), 'HS256')
 end
 def self.decode(token)
 JWT.decode(token, ENV.fetch('DEVISE_JWT_SECRET_KEY', DEFAULT_SECRET_KEY), true, algorithm: 'HS256').first
 end
end