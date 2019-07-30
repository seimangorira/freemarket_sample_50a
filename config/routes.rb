Rails.application.routes.draw do
  root 'tops#index'
  # resources :users
  get 'users/profile' => 'users#profile'
end
