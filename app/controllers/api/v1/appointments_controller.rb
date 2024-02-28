# class AppointmentsController < ApplicationController
#   before_action :set_appointment, only: [:show, :update, :destroy]

#   # GET /api/v1/appointments
#   def index
#     @appointments = Appointment.all
#     render json: @appointments
#   end

#   # GET /api/v1/appointments/:id
#   def show
#     render json: @appointment
#   end

#   # POST /api/v1/appointments
#   def create
#     @appointment = Appointment.new(appointment_params)
#     if @appointment.save
#       render json: @appointment, status: :created
#     else
#       render json: @appointment.errors, status: :unprocessable_entity
#     end
#   end

#   # PATCH/PUT /api/v1/appointments/:id
#   def update
#     if @appointment.update(appointment_params)
#       render json: @appointment
#     else
#       render json: @appointment.errors, status: :unprocessable_entity
#     end
#   end

#   # DELETE /api/v1/appointments/:id
#   def destroy
#     @appointment.destroy
#     head :no_content
#   end

#   private

#   def set_appointment
#     @appointment = Appointment.find(params[:id])
#   end

#   def appointment_params
#     params.require(:appointment).permit(:date, :time, :user_id, :doctor_id, :city)
#   end
# end