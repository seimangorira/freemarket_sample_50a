Rails.application.routes.draw do
  root 'tops#index'
  get 'users/top' => "users#top"
  get "users/first" => "users#first"
  get "users/second" => "users#second"
  get "users/third" => "users#third"
  get "users/credit" => "users#credit"
  get "users/complete" => "users#complete"
end
