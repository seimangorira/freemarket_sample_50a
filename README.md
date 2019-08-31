## Usersテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|first_name|string|null: false|
|first_name_kana|string|null: false|
|last_name|string|null: false|
|last_name_kana|string|null: false|
|birthday|date||
|avatar|text||
|introduction|text||
|e-mail|string|null: false, unique: true|
|password|string|null: false|
|phone_number|integer|unique: true|

### Association
- has_many :comments
- has_one :credit
- has_many :buyer_items, foreign_key: "buyer_id", class_name: "Item"
- has_many :saling_items, -> { where("buyer_id is NULL")}, foreign_key: "salier_id", class_name: "Item"
- has_many :sold_items, -> { where("buyer_id is NULL")}, foreign_key: "salier_id", class_name: "Item"


## Itemsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false, index: true|
|price|integer|null: false|
|state|integer|null: false|
|introduction|text|null: false|
|brand|string||
|status|integer|null: false|
|size|integer||
|delivery_fee|integer||
|city|string|null: false|
|delivery_days|date|null: false|
|category_id|bigint|null: false|
|saler_id|references|null: false, foreign_key: true|
|buyer_id|references|null: false, foreign_key: true|

### Association
- belongs_to :saler, class_name: "User"
- belongs_to :buyer, class_name: "User"
- has_many_attached :images
- belongs_to :category
extend ActiveHash::Associations::ActiveRecordExtensions  
- belongs_to_active_hash :prefecture


## Addressesテーブル

|Column|Type|Options|
|------|----|-------|
|first_name|string|null: false|
|first_name_kana|string|null: false|
|last_name|string|null: false|
|last_name_kana|string|null: false|
|postal_cord|integer|null: false|
|state|string|null: false|
|municipalities|string|null: false|
|house_number|string|null: false|
|building_name|string||
|phone_number|integer|unique: true|

### Association


## Categoriesテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string||

### Association
- has_many :items
- has_ancestry


## Sns_credentialsテーブル

|Column|Type|Options|
|------|----|-------|
|provider|string||
|uid|string||
|user_id|references|foreign_key: true|

### Association
- belongs_to :user


## Active_storage_attachmentsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|record_type|string|null: false|
|record_id|references|null: false, polymorphic: true, index: false|
|blob_id|references|null: false|

### Association


## Active_storage_blobsテーブル

|Column|Type|Options|
|------|----|-------|
|key|string|null: false|
|filename|string|null: false|
|content_type|string||
|metadata|text||
|byte_size|bigint|null: false|
|checksum|string|null: false|

### Association


## Commentsテーブル

|Column|Type|Options|
|------|----|-------|
|text|text||
|user_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item

