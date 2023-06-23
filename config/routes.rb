Rails.application.routes.draw do
  devise_for :clients
  devise_scope :client do
    get '/clients/sign_out', to:'devise/sessions#destroy'
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get 'new_reservation/:flight_id', to: 'reservation#new', as: :new_reservations
  post 'new_reservation/:flight_id', to: 'reservation#create', as: :new_reservation_creation
  get 'reservation_success/:id', to: 'reservation#success', as: :reservations
  delete 'reservation/:id', to: 'reservation#delete', as: :delete_reservations
  get 'reservation/history', to: 'reservation#history', as: :reservation_history
  root to: "home#index"
end
