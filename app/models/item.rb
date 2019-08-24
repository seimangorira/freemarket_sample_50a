class Item < ApplicationRecord
  belongs_to :category
  has_many_attached :images

  extend ActiveHash::Associations::ActiveRecordExtensions  
  belongs_to_active_hash :prefecture

  belongs_to :saler, class_name: "User"
  belongs_to :buyer, class_name: "User", optional: true

  # 商品出品時、編集時のバリデーション
  validates :name, presence: true, length: { maximum: 40 }
  validates :price, numericality: { only_integer: true, greater_than_or_equal: 300, less_than_or_equal_to: 9999999 }
  validates :introduction, presence: true, length: { maximum: 1000 }

  with_options presence: true do
    validates :state
    validates :delivery_fee
    validates :delivery_method
    validates :city
    validates :delivery_days
    validates :category_id
  end

  # ActiveStorageのバリデーションは未実装
  
end
