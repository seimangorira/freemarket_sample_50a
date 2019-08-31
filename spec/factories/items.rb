FactoryBot.define do
  factory :item do
    name {"テスト"}
    price {20000}
    state {1}
    introduction {"テスト用のアイテムです"}
    brand {"シャネル"}
    status {2}
    size {2}
    delivery_fee {1}
    delivery_method {2}
    city {"大阪府"}
    delivery_days {'1日〜2日'}
    category_id {159}
    saler_id {1}
  end
end