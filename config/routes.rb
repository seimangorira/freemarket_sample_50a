Rails.application.routes.draw do
  root 'tops#index'
  resources :items, only: [:new]
  get 'users/logout' => 'users#logout'
  # resources :users
  get 'users/profile' => 'users#profile'
  get 'users/identification' => 'users#identification'
end
