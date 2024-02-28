# class Api::V1::DoctorsController < ApplicationController
#   before_action :set_doctor, only: [:show, :update, :destroy]

#       # GET /api/v1/doctors
#       def index
#         @doctors = Doctor.all
#         render json: @doctors
#       end

#       # GET /api/v1/doctors/:id
#       def show
#         render json: @doctor
#       end

#       # POST /api/v1/doctors
#       def create
#         @doctor = Doctor.new(doctor_params)
#         if @doctor.save
#           render json: @doctor, status: :created
#         else
#           render json: @doctor.errors, status: :unprocessable_entity
#         end
#       end

#       # PATCH/PUT /api/v1/doctors/:id
#       def update
#         if @doctor.update(doctor_params)
#           render json: @doctor
#         else
#           render json: @doctor.errors, status: :unprocessable_entity
#         end
#       end

#       # DELETE /api/v1/doctors/:id
#       def destroy
#         @doctor.destroy
#         head :no_content
#       end

#       private

#       def set_doctor
#         @doctor = Doctor.find(params[:id])
#       end

#       def doctor_params
#         params.require(:doctor).permit(:name, :specialty, :image, :bio)
#       end

# end
