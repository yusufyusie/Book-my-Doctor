module Api
  module V1
    class AppointmentsController < ApplicationController
      before_action :set_appointment, only: [:show, :update, :destroy]

      # GET /appointments
      def index
        @appointments = Appointment.where(user_id: @current_user.id).order(created_at: :desc)
        render json: @appointments
      end

      # GET /appointments/:id
      def show
        render json: @appointment
      end

      # POST /appointments
      def create
        @appointment = Appointment.new(appointment_params)
        @appointment.user_id = @current_user.id

        if @appointment.save
          render json: @appointment, status: :created
        else
          render json: @appointment.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /appointments/:id
      def update
        if @appointment.update(appointment_params)
          render json: @appointment
        else
          render json: @appointment.errors, status: :unprocessable_entity
        end
      end

      # DELETE /appointments/:id
      def destroy
        @appointment.destroy
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
