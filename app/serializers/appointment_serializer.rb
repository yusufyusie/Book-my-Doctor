# app/serializers/appointment_serializer.rb

class AppointmentSerializer < ActiveModel::Serializer
  attributes :id, :date_of_appointment, :status

  belongs_to :user
  belongs_to :doctor
end
