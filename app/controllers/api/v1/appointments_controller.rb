module Api
  module V1
    class AppointmentsController < ApplicationController
      before_action :set_appointment, only: [:show, :update, :destroy]

      # GET /appointments
      def index
        @appointments = Appointment.where(user_id: @current_user.id).order(created_at: :desc)
        render json: { appointments: @appointments }
      end

      # GET /appointments/:id
      def show
        if @appointment.user_id == @current_user.id
          render json: { appointment: @appointment }, status: :ok
        else
          render json: { errors: @appointment.errors.full_messages }
        end
      end

      # POST /appointments
      def create
        @appointment = Appointment.new(appointment_params)
        @appointment.user_id = @current_user.id

        if @appointment.save
          render json: { appointment: @appointment, success: 'Appointment has been created.' }, status: :created
        else
          render json: { errors: @appointment.errors.full_messages }, status: :bad_request
        end
      end

      # PATCH/PUT /appointments/:id
      def update
        if @appointment.update(appointment_params)
          render json: { appointment: @appointment, success: 'Appointment has been updated.' }
        else
          render json: { errors: @appointment.errors.full_messages }, status: :bad_request
        end
      end

      # DELETE /appointments/:id
      def destroy
        if @appointment.destroy
          render json: { success: 'Appointment has been deleted.' }
        else
          render json: { errors: @appointment.errors.full_messages }, status: :bad_request
        end
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_appointment
        @appointment = Appointment.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def appointment_params
        params.require(:appointment).permit(:doctor_id, :date, :time, :reason)
      end
    end
  end
end
