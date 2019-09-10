Rails.application.routes.draw do
  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
    get "signup" => "devise/registrations#index", as: "signup_index"
    get "/signup/registration" => "devise/registrations#new", as: "signup_registration"
    get "/signup/confirmation" => "phonenumbers#new", as: "phonenumber_registration"
    get "/signup/address/:id" => "addresses#new", as: "address_new_registration"
    post "/signup/address/:id" => "addresses#create", as: "address_create_registration"
    get "/signup/credit/:id" => "credits#new", as: "credit_new_registration"
    post "/signup/credit/:id" => "credits#create", as: "credit_create_registration"
    get "/signup/complete" => "users/registrations#complete", as: "complete_registration"
  end
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
   }
  root 'tops#index'
  resources :phonenumbers, only: [:new, :create]
  resources :items, only: [:new]
  get "items/buy" => "items#buy"
  get "users/login" => "users#login"
  get 'users/profile' => 'users#profile'
  get 'users/identification' => 'users#identification'
  get "users/card" => "users#card"
  get "users/addCard" => "users#addCard"
  get "users/logout" => "users#logout"
  resources :users, only: [:show]
  resources :exhibitions, only: [:index, :show]
  resources :items, only: [:new, :create, :show, :edit, :update, :destroy] do
    collection do
      get 'search'
      get 'get_children_categories', defaults: { format: 'json' }
      get 'get_grandchildren_categories', defaults: { format: 'json' }
    end
  end
end
