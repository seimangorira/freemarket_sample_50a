Rails.application.routes.draw do
  devise_scope :user do
    get "/signup/registration" => "devise/registrations#new", as: "new_user_registration" # sign_up/registrationへのカスタムパス
  end
  devise_for :users
  root 'tops#index'

  get 'users/signup' => "users#signup"
  get "users/registration" => "users#registration"
  get "users/confirmation" => "users#confirmation"
  get "users/address" => "users#address"
  get "users/credit" => "users#credit"
  get "users/complete" => "users#complete"
  resources :items, only: [:new]
  get "items/buy" => "items#buy"
  get "users/login" => "users#login"
  get 'users/logout' => 'users#logout'
  get 'users/profile' => 'users#profile'
  get 'users/identification' => 'users#identification'
  get "users/card" => "users#card"
  get "users/addCard" => "users#addCard"
  resources :users, only: [:show]
  get 'items/detail' => 'items#detail'
  resources :items, only: [:new]
end
