class UsersController < ApplicationController

  def step1
    # binding.pry
    @user = User.new # 新規インスタンス作成
  end
  
  def step2
    # binding.pry
    # step1で入力された値をsessionに保存
    session[:nickname] = user_params[:nickname]
    session[:email] = user_params[:email]
    # session[:password] = user_params[:password]
    session[:encrypted_password] = user_params[:encrypted_password]
    # session[:password_confirmation] = user_params[:password_confirmation]
    session[:last_name] = user_params[:last_name]
    session[:first_name] = user_params[:first_name]
    session[:last_name_kana] = user_params[:last_name_kana]
    session[:first_name_kana] = user_params[:first_name_kana]
    session[:birthday] = user_params[:birthday]
    @user = User.new # 新規インスタンス作成
  end

  def step3
    # step2で入力された値をsessionに保存
    session[:phone_number] = user_params[:phone_number]
    @user = User.new # 新規インスタンス作成
    @address = Address.new
    # binding.pry
  end

  def create
    # binding.pry
    @user = User.new(
      nickname: session[:nickname], # sessionに保存された値をインスタンスに渡す
      email: session[:email],
      encrypted_password: session[:encrypted_password],
      last_name: session[:last_name],
      first_name: session[:first_name],
      last_name_kana: session[:last_name_kana],
      first_name_kana: session[:first_name_kana],
      birthday: session[:birthday],
      phone_number: session[:phone_number]
    )
    if @user.save
     # ログインするための情報を保管
      session[:id] = @user.id
      redirect_to step3_signup_index_path
    else
      # render '/users/sign_in'
    end
  end

  def signup
  end

  def first
  end

  def second
  end

  def third
  end

  def credit
  end

  def complete
  end

  def login
    
  end

  def logout
  end

  def show
  end

  def profile
  end

  def identification
  end

  def card
  end

  def addCard
  end

end
