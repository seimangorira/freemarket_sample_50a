class SnsCredential < ApplicationRecord
  validates :provider, presence: true
  validates :uid, presence: true
  validates :user_id, presence: true
  
end
