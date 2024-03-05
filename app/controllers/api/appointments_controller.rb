class Api::AppointmentsController < ApplicationController
  before_action :authenticate_token!, only: %i[index show create destroy]

  def index
    appointments = @current_user.appointments.includes(:doctor)
    if appointments.empty?
      render json: { error: 'No appointments found' }, status: :not_found
    else
      appointments_details = appointments.map do |appointment|
        {
          id: appointment.id,
          doctor: {
            name: appointment.doctor.name,
            specialization: appointment.doctor.specialization,
            cost: appointment.doctor.cost,
            image_url: appointment.doctor.image_url
          },
          user_id: appointment.user_id,
          date_of_appointment: appointment.date_of_appointment,
          imageUrl: appointment.doctor.image_url
        }
      end
      render json: { data: appointments_details, message: 'Appointments loaded successfully' }, status: :ok
    end
  end

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

  def destroy
    appointment = current_user.appointments.find_by(id: params[:id])
    if appointment
      if appointment.destroy
        render json: { message: 'Appointment deleted successfully' }, status: :ok
      else
        render json: { error: 'Failed to delete appointment' }, status: :unprocessable_entity
      end
    else
      render json: { error: 'Appointment not found' }, status: :not_found
    end
  end

  private
  def appointment_params
    params.require(:appointment).permit(:user_id, :doctor_id, :date_of_appointment, :status)
  end 
end
