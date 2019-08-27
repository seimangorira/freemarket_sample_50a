Rails.application.routes.draw do
  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
    get "signup" => "signup#index", as: "signup_index"
    get "/signup/registration" => "signup#step1", as: "step1_signup_index" # sign_up/registrationへのカスタムパス
    get "/signup/confirmation" => "signup#step2", as: "step2_signup_index"
    get "/signup/address" => "signup#step3", as: "step3_signup_index"
    get "/signup/credit" => "signup#step4", as: "step4_signup_index"
    get "/signup/complete" => "signup#done", as: "done_signup_index"
  end
  devise_for :users
  root 'tops#index'
  resources :signup do
    collection do
      get 'index'
      get 'step1'
      get 'step2'
      get 'step3'
      get 'step4' # ここで、入力の全てが終了する
      get 'done' # 登録完了後のページ
    end
  end
  get "users/first" => "users#first"
  get "users/second" => "users#second"
  get "users/third" => "users#third"
  get "users/credit" => "users#credit"
  get "users/complete" => "users#complete"
  resources :items, only: [:new]
  get "items/buy" => "items#buy"
  get "users/login" => "users#login"
  get 'users/logout' => 'users#logout'
  get 'users/profile' => 'users#profile'
  get 'users/identification' => 'users#identification'
  get "users/card" => "users#card"
  get "users/addCard" => "users#addCard"
  resources :users, only: [:show]
  get 'items/detail' => 'items#detail'
  resources :items, only: [:new, :create]
end
