Rails.application.routes.draw do
  root 'tops#index'
  get 'users/logout' => 'users#logout'
  # resources :users
  get 'users/profile' => 'users#profile'
end
