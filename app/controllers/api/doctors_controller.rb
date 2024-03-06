class Api::DoctorsController < ApplicationController
  before_action :authenticate_token!, only: %i[index show create destroy]

  def index
    @doctors = Doctor.all
    doctors_data = @doctors.map do |doctor|
      {
        id: doctor.id,
        name: doctor.name,
        specialization: doctor.specialization,
        cost: doctor.cost,
        image_url: doctor.image_url
      }
    end

    if @doctors.present?
      render json: { data: doctors_data, message: 'All doctors loaded' }, status: :ok
    else
      render json: { error: 'No doctors found' }, status: :not_found
    end
  end

  def show
    @doctor = Doctor.find_by(id: params[:id])

    if @doctor
      appointments_count = @doctor.appointments.count

      render json: {
        id: @doctor.id,
        name: @doctor.name,
        specialization: @doctor.specialization,
        cost: @doctor.cost,
        image_url: @doctor.image_url,
        appointments_count:
      }, status: :ok
    else
      render json: { error: 'Doctor not found' }, status: :not_found
    end
  end

  def create
    @doctor = Doctor.new(doctor_params)
    if @doctor.save
      render json: { data: @doctor, message: 'doctor created successfully' }, status: :created
    else
      render json: @doctor.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @doctor = Doctor.find_by(id: params[:id])
    if @doctor.destroy
      render json: { message: 'Doctor deleted successfully' }, status: :ok
    else
      render json: { error: 'Failed to delete doctor' }, status: :unprocessable_entity
    end
  end

  private

  def doctor_params
    params.require(:doctor).permit(:name, :specialization, :cost, :image_url)
  end
end
