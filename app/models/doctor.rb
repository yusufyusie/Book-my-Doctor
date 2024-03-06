class Doctor < ApplicationRecord
  has_many :appointments, dependent: :destroy
  has_many :users, through: :appointments

  validates :name, presence: true, length: { maximum: 255 }
  validates :specialization, presence: true, length: { maximum: 255 }
  validates :cost, presence: true
  validates :image_url, presence: true
end
