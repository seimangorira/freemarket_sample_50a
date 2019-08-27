class SignupController < ApplicationController
  # 各アクションごとに新規インスタンスを作成します
  # 各アクションごとに、遷移元のページのデータをsessionに保管していきます
  
  def index
    @user = User.new # 新規インスタンス作成
  end
  
  def step2
    # step1で入力された値をsessionに保存
    session[:nickname] = user_params[:nickname]
    session[:email] = user_params[:email]
    session[:password] = user_params[:password]
    # session[:password_confirmation] = user_params[:password_confirmation]
    session[:last_name] = user_params[:last_name]
    session[:first_name] = user_params[:first_name]
    session[:last_name_kana] = user_params[:last_name_kana]
    session[:first_name_kana] = user_params[:first_name_kana]
    session[:birthday] = user_params[:birthday]
    @user = User.new # 新規インスタンス作成
  end
  
  def step2
    # step2で入力された値をsessionに保存
    session[:phone_number] = user_params[:phone_number]
    @user = User.new # 新規インスタンス作成
  end

  def create
    @user = User.new(
      nickname: session[:nickname], # sessionに保存された値をインスタンスに渡す
      first_name: session[:first_name],
      first_name_kana: session[:first_name_kana],
      last_name: session[:last_name],
      last_name_kana: session[:last_name_kana],
      birthday: session[:birthday],
      avatar: session[:lavatar],
      introduction: session[:introduction],
      email: session[:email],
      password: session[:password],
      phone_number: session[:phone_number]
    )
    if @user.save
     # ログインするための情報を保管
      session[:id] = @user.id
      redirect_to done_signup_index_path
    else
      render '/signup/registration'
    end
  end

  def done
    sign_in User.find(session[:id]) unless user_signed_in?
  end

  private
  # 許可するキーを設定します

  # def user_params
  #   params.require(:user).permit(
  #     :nickname, 
  #     :first_name, 
  #     :first_name_kana, 
  #     :last_name, 
  #     :last_name_kana, 
  #     :birthday, 
  #     :avatar, 
  #     :introduction, 
  #     :email,
  #     :password,
  #     :phone_number
  # )
  # end
  
end
