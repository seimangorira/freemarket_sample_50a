Rails.application.routes.draw do
  root 'tops#index'
  get 'toppage/index' => 'toppage#index'
end
