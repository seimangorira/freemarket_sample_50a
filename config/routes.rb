Rails.application.routes.draw do
  root 'tops#index'
  get 'toppage/index' => 'toppage#index'
  resources :items, only: [:new]
  get 'users/logout' => 'users#logout'
  get 'users/profile' => 'users#profile'
  get 'users/identification' => 'users#identification'
  resources :users, only: [:show]
end
