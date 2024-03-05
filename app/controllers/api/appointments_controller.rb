class Api::AppointmentsController < ApplicationController
  before_action :authenticate_token!, only: %i[index show create destroy]

  def show
  end

  # def create
  #   appointment = Appointment.new(appointment_params)
  
  #   if appointment.save
  #     response = {
  #       doctor_id: appointment.doctor_id,
  #       date_of_appointment: appointment.date_of_appointment.strftime('%A, %d %B %Y')
  #     }
  #     render json: { data: response, message: 'Appointment created' }, status: :created
  #   else
  #     render json: { error: 'Validation failed', errors: appointment.errors.full_messages }, status: :unprocessable_entity
  #   end
  # end


  def create
    appointment = current_user.appointments.build(appointment_params)

    if appointment.status == "canceled"
      render json: { error: "Appointment creation canceled" }, status: :unprocessable_entity
      return
    end

    if appointment.save
      response = {
        doctor_id: appointment.doctor_id,
        date_of_appointment: appointment.date_of_appointment.strftime('%A, %d %B %Y')
      }
      render json: { data: appointment, message: 'Appointment created' }, status: :created
    else
      render json: { error: 'Validation failed', errors: appointment.errors.full_messages }, status: :unprocessable_entity
    end
  end


  private
  def appointment_params
    params.require(:appointment).permit(:user_id, :doctor_id, :date_of_appointment, :status)
  end 
end
