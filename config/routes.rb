Rails.application.routes.draw do
  get 'up' => 'rails/health#show', as: :rails_health_check
  
  namespace :api do
    get 'appointments/index'
    get 'appointments/show'
    get 'appointments/create'
    get 'appointments/destroy'
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  
    namespace :api do
      root "doctors#index"
    end

  post '/login', to: 'sessions#create'
  post '/signup', to: 'registrations#create'
 
 namespace :api do
  resources :doctors, only: [:index, :show, :create, :destroy]
  resources :appointments, only: [:index, :create, :destroy]
end

end
