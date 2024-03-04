module Api
  module V1
    class DoctorsController < ApplicationController
      before_action :authenticate_token!, only: [:index, :show, :create, :destroy]
      before_action :set_doctor, only: [:show, :destroy]

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
        render json: { data: @doctor, message: 'Doctor loaded' }, status: :ok
      end

      def create
        @doctor = Doctor.new(doctor_params)

        if @doctor.save
          render json: { data: @doctor, message: 'Doctor created successfully' }, status: :created
        else
          render json: { error: @doctor.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def destroy
        @doctor = Doctor.find(params[:id])
        if @doctor.destroy
          render json: { message: 'Doctor deleted successfully' }, status: :ok
        else
          render json: { error: 'Failed to delete doctor' }, status: :unprocessable_entity
        end
      end

      private

      def set_doctor
        @doctor = Doctor.find(params[:id])
      end

      def doctor_params
        params.require(:doctor).permit(:name, :specialization, :cost, :image_url)
      end
    end
  end
end
