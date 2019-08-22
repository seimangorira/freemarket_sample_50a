class Item < ApplicationRecord
  belongs_to :category
  has_many_attached :images

  extend ActiveHash::Associations::ActiveRecordExtensions  
  belongs_to_active_hash :prefecture

  belongs_to :saler, class_name: "User"
  belongs_to :buyer, class_name: "User", optional: true
end
