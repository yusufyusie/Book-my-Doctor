class RenameDateColumnInAppointments < ActiveRecord::Migration[7.0]
  def change
    rename_column :appointments, :date, :date_of_appointment
  end
end
