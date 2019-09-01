Rails.application.routes.draw do
  devise_for :users
  root 'tops#index'
  get 'users/top' => "users#top"
  get "users/first" => "users#first"
  get "users/second" => "users#second"
  get "users/third" => "users#third"
  get "users/credit" => "users#credit"
  get "users/complete" => "users#complete"
  resources :phonenumbers, only: [:new, :create]
  resources :items, only: [:new]
  get "items/buy" => "items#buy"
  get "users/login" => "users#login"
  get 'users/logout' => 'users#logout'
  get 'users/profile' => 'users#profile'
  get 'users/identification' => 'users#identification'
  get "users/card" => "users#card"
  get "users/addCard" => "users#addCard"
  resources :users, only: [:show]
  resources :items, only: [:new, :create, :show] do
    collection do
      get 'get_children_categories', defaults: { format: 'json' }
      get 'get_grandchildren_categories', defaults: { format: 'json' }
    end
  end
end
