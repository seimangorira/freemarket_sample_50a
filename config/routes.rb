Rails.application.routes.draw do
  root 'tops#index'
  get 'items/detail' => 'items#detail'
end
