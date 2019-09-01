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
<<<<<<< HEAD
    delivery_days {1}
    category_id {3}
=======
    delivery_days {'1日〜2日'}
    category_id {159}
>>>>>>> parent of c454d21... テストコードの記載
    saler_id {1}
  end
end
