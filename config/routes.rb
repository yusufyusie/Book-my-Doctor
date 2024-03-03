Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  post '/login', to: 'sessions#create'
 post '/signup', to: 'registrations#create'
 
 namespace :api do
  resources :doctors, only: [:index, :show, :create, :destroy]
end

end
