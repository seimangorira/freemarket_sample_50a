Rails.application.routes.draw do
  root 'tops#index'
  get 'users/index' => 'users#index'
end
