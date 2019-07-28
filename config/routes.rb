Rails.application.routes.draw do
  root 'tops#index'
  get 'users/show' => 'users#show'
end
