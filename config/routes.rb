Rails.application.routes.draw do
  
  resources :users, only: [:edit]
  resource :profile,only: [:show,:edit, :update]

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  resources :rooms
  resources :reservations
  post 'reservations/confirm', to: 'reservations#confirm'
  
  devise_for :users
  root 'home#index' 
  get 'home/index'
  
  get '/users/account' => 'users#account'
  
  get "search",to: 'rooms#search'
  get "searcharea",to: 'rooms#searcharea'
end
