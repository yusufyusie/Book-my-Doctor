Rails.application.routes.draw do
  namespace :api do
    get 'appointments/index'
    get 'appointments/show'
    get 'appointments/create'
    get 'appointments/update'
    get 'appointments/destroy'
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
   # root "doctors#index"
  post '/login', to: 'sessions#create'
  post '/signup', to: 'registrations#create'
 
 namespace :api do
  resources :doctors, only: [:index, :show, :create, :destroy]
  resources :appointments, only: [:index, :create, :destroy]
end

end
