Rails.application.routes.draw do
  root 'tops#index'
  get 'users/top' => "users#top"
  get "users/first" => "users#first"
  get "users/second" => "users#second"
  get "users/third" => "users#third"
  get "users/credit" => "users#credit"
  get "users/complete" => "users#complete"
  resources :items, only: [:new]
  get "items/buy" => "items#buy"
  get 'users/logout' => 'users#logout'
  get 'users/profile' => 'users#profile'
  get 'users/identification' => 'users#identification'
  resources :users, only: [:show]
end
