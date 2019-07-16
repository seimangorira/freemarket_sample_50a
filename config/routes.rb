Rails.application.routes.draw do
  root 'tops#index'
  get 'users/top' => "users#top"
end
