class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }, confirmation: true

  with_options presence: true do
    validates :nickname
    validates :first_name
    validates :first_name_kana
    validates :last_name
    validates :last_name_kana
  end

  has_many :comments
  has_one :credit
  has_many :sns_credentials, dependent: :destroy



  devise :omniauthable,omniauth_providers: [:facebook, :google_oauth2]

  def self.from_omniauth(auth)
    user = User.find_by(email: auth.info.email)
    sns = SnsCredential.where(provider: auth.provider, uid: auth.uid).first
    if sns == nil && user == nil
      @user = User.new(
        nickname: auth.info.name,
        first_name: "",
        first_name_kana: "",
        last_name: "",
        last_name_kana: "",
        email: auth.info.email,
        password: Devise.friendly_token[0,20]
        )
      @user.save(validate: false)
      @sns = SnsCredential.create(
        user_id: @user.id,
        provider: auth.provider,
        uid: auth.uid
        )
      @user = User.find(@sns.user_id)
    elsif sns == nil && user
      @user = User.find_by(email: auth.info.email)
      @sns = SnsCredential.create(
        user_id: @user.id,
        provider: auth.provider,
        uid: auth.uid
        )
    else
      @user = User.find(sns.user_id)
    end
    @user
  end
  has_many :buyer_items, foreign_key: "buyer_id", class_name: "Item"
  has_many :saling_items, -> { where("buyer_id is NULL")}, foreign_key: "seller_id", class_name: "Item"
  has_many :sold_items, -> { where("buyer_id is NULL")}, foreign_key: "seller_id", class_name: "Item"
end

