# app/serializers/doctor_serializer.rb
class DoctorSerializer < ActiveModel::Serializer
  include JSONAPI::Serializer
  attributes :id, :name, :specialization, :cost, :image_url
end
