# Development of Database

### usersテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|email|text|null: false|
|password|text|null: false|
|address|text|null: false, foreign_key: true|
### Association
- has_many :items
- has_many :comments
- has_many :favorites
- has_one :credit_card
### itemsテーブル
|name|string|null: false|
|introduction|text|null: false|
|price|integer|null: false|
|brand|string|null: false|
|item_image_id|reference|null: false, foreign_key: true|
|condition|string|null:false|
|preparation_day|integer|null:false|
### Association
- has_many :favorites
- has_many :comments throught: :comments
- has_many :item_images
- belongs_to :user
- belongs_to :category
## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|reference|null:false, foreign_key: true|
|item_id|reference|null:false, foreign_key: true|
|comment|text|null:false|
### Association
- belongs_to :user
- belongs_to :item
## favoritesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|reference|null:false, foreign_key: true|
|item_id|reference|null:false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :item
## item_imagesテーブル
|Column|Type|Options|
|------|----|-------|
|item_id|reference|null:false, foreign_key: true|
|url|string|null:false|
### Association
- belongs_to :item
|Column|Type|Options|
|------|----|-------|
|card＿number|integer|null: false|
|expiration_month|integer|null: false|
|expiration_year|integer|ull: false|
|security_code|integer|ull: false|
|user_id|references|null: false, foreign_key: true|
## credit_cardsデーブル
|Column|Type|Options|
|------|----|-------|
|card＿number|integer|null: false|
|expiration_month|integer|null: false|
|expiration_year|integer|ull: false|
|security_code|integer|ull: false|
|user_id|references|null: false, foreign_key: true|
### Association
- belongs_to :user
