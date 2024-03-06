# spec/controllers/api/doctors_controller_spec.rb

require 'rails_helper'

RSpec.describe Api::DoctorsController, type: :controller do
  describe 'GET #index' do
    it 'returns a success response' do
      get :index
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    let(:doctor) { Doctor.create(name: 'Dr. John Doe', specialization: 'General Physician') }

    it 'returns a success response' do
      get :show, params: { id: doctor.id }
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    it 'creates a new doctor' do
      expect {
        post :create, params: { doctor: { name: 'Dr. Jane Smith', specialization: 'Dermatologist' } }
      }.to change(Doctor, :count).by(1)
    end
  end

  describe 'DELETE #destroy' do
    let!(:doctor) { Doctor.create(name: 'Dr. Jack Brown', specialization: 'Pediatrician') }

    it 'destroys the requested doctor' do
      expect {
        delete :destroy, params: { id: doctor.id }
      }.to change(Doctor, :count).by(-1)
    end
  end
end
