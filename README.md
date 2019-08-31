## Usersテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|first_name|string|null: false|
|first_name_kana|string|null: false|
|last_name|string|null: false|
|last_name_kana|string|null: false|
|birthday|date||
|avatar|text|-|
|introduction|text|-|
|e-mail|string|null: false, unique: true|
|password|string|null: false|
|phone_number|integer|unique: true|

### Association
- has_many :comments
- has_one :credit
- has_many :buyer_items, foreign_key: "buyer_id", class_name: "Item"
- has_many :saling_items, -> { where("buyer_id is NULL")}, foreign_key: "salier_id", class_name: "Item"
- has_many :sold_items, -> { where("buyer_id is NULL")}, foreign_key: "salier_id", class_name: "Item"


## Creditsテーブル

|Column|Type|Options|
|------|----|-------|
|card_number|integer|null: false, unique: true|
|expiration_date|date|null: false|
|pin|integer|null: false, unique: true|
|user_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user


## Itemsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false, index: true|
|price|integer|null: false|
|state|integer|null: false|
|introduction|text|null: false|
|parent_category|string|null: false, index: true|
|child_category|string|null: false, index: true|
|grandchild_category|string|null: false, index: true|
|brand|string||
|status|integer|null: false|
|size|integer||
|delivery_fee|integer||
|city|string|null: false|
|delivery_days|date|null: false|
|saler_id|references|null: false, foreign_key: true|
|buyer_id|references|null: false, foreign_key: true|
|user_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :saler, class_name: "User"
- belongs_to :buyer, class_name: "User"
- has_many :comments
- has_many :images


## Imagesテーブル

|Column|Type|Options|
|------|----|-------|
|image|text|null: false|
|item_id|references|null: false, foreign_key: true|

### Association
- belongs_to :item


## Commentsテーブル

|Column|Type|Options|
|------|----|-------|
|text|text||
|user_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item

