### usersテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|icon_image|string||
|background_image|string||
|email|text|null: false|
|password|text|null: false|
### Association
- has_many :items through: :comments
- has_many :comments
- has_many :favorites
- has_one :credit_card
- has_one :address

### itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|introduction|text|null: false|
|price|integer|null: false|
|brand|string||
|condition|string|null:false|
|preparation_day|integer|null:false|
|exhibitor|integer|foreign_key: true|
|buyer|integer|foreign_key: true|
### Association
- has_many :favorites
- has_many :comments
- has_many :item_images
- belongs_to :user

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null:false, foreign_key: true|
|item_id|integer|null:false, foreign_key: true|
|message|text|null:false|
### Association
- belongs_to :user
- belongs_to :item

## favoritesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null:false, foreign_key: true|
|item_id|integer|null:false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :item

## item_imagesテーブル
|Column|Type|Options|
|------|----|-------|
|item_id|integer|null:false, foreign_key: true|
|url|string|null:false|
### Association
- belongs_to :item

## credit_cardsデーブル
|Column|Type|Options|
|------|----|-------|
|card＿number|integer|null: false|
|expiration_month|integer|null: false|
|expiration_year|integer|ull: false|
|security_code|integer|ull: false|
|user_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user

## addressテーブル
|Column|Type|Options|
|------|----|-------|
|postalcode|integer||
|prefecture|string||
|town|string||
|street|string||
|building|string||
### Association
- belongs_to :user