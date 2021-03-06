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
    omniauth_callbacks: "users/omniauth_callbacks",
    registrations: 'users/registrations',
    sessions: 'users/sessions'
   }
  root 'tops#index'
  resources :tops, only: [:index] do
    collection do
      get 'get_child_categories', defaults: { format: 'json' }
      get 'get_grandchild_categories', defaults: { format: 'json' }
    end
  end
  resources :phonenumbers, only: [:new, :create]
  resources :users, only: [:show] do
    resources :credits, only: [:index, :create]
    collection do
      get 'card'
      get 'identification'
      get 'logout'
      get 'profile'
    end
  end
  resources :exhibitions, only: [:index, :show]
  resources :items, except: [:index] do
    collection do
      get 'search'
      get 'get_children_categories', defaults: { format: 'json' }
      get 'get_grandchildren_categories', defaults: { format: 'json' }
    end
  end
  resources :purchases, only: [:show, :update]
end
