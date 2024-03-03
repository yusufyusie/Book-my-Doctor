class User < ApplicationRecord
  has_secure_password
  has_many :doctors, dependent: :destroy
  has_many :appointments, dependent: :destroy

  validates :name, presence: true
  validates :email, presence: true
  validates :password, presence: true
end
