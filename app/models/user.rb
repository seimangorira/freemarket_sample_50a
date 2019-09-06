class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, uniqueness: true

  has_many :comments
  has_one :credit
  has_many :buyer_items, foreign_key: "buyer_id", class_name: "Item"
  has_many :saling_items, -> { where("buyer_id is NULL")}, foreign_key: "seller_id", class_name: "Item"
  has_many :sold_items, -> { where("buyer_id is NULL")}, foreign_key: "saler_id", class_name: "Item"
end
