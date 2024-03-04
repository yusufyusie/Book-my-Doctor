class Appointment < ApplicationRecord
  belongs_to :doctor
  belongs_to :user

  validates :date, presence: true, allow_blank: false
  validates :time, presence: true, allow_blank: false
  validates :doctor, presence: true, allow_blank: false
  validates :user, presence: true, allow_blank: false
  validates :reason, presence: true, allow_blank: false
end
