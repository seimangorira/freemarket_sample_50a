Rails.application.routes.draw do
  root 'tops#index'
  get 'users/logout' => 'users#logout'
end
