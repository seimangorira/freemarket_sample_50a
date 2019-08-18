class Item < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :images
  belongs_to :saler, class_name: "User"
  belongs_to :buyer, class_name: "User"
end
