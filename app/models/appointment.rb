class Appointment < ApplicationRecord
  belongs_to :user
  belongs_to :doctor

  # Validations
  validates :date_of_appointment, presence: true
end
