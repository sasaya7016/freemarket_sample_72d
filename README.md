# フリーマーケットアプリ

## 概要
> ### このアプリでできること
>> ユーザーの登録、削除、ログイン、ログアウト
>> ユーザー登録後に商品の出品、購入、削除、お気に入り、パンクズ、商品に対するコメント
>> マイページ機能から購入履歴の確認、ユーザー登録情報の変更、退会
>> 商品の検索、商品購入の際クレジットカードを登録させて購入

## 使用した技術
>> Ruby on Rails,Javascript,SCSS,Mysql,AWS

## 制作背景
>> フリーマーケットアプリの制作を通してフロントからサーバーサイドまでの技術理解を満遍なく深めるために作成した。
 
### usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|lastname|string|null: false|
|firstname|string|null: false|
|lastnameKANA|string|null: false|
|firstnameKANA|string|null: false|
|birth_date|date|null:false|
|icon_image|string||
|background_image|string||
|profile|text||
|email|string|null: false|
|password|string|null: false|
### Association
- has_many :items
- has_many :comments, through: :comments
- has_many :favorites, dependent: :destroy
- has_many :favorite_items, through: :favorites, source: :item
- has_one :credit_card
- has_one :address

### itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|introduction|text|null: false|
|price|integer|null: false|
|brand|string||
|category_id|integer|null:false|
|item_size|string||
|status|string|null:false|
|favorites_count|integer||
|preparation_day|integer|null:false|
|exhibitor_id|integer||
|purchaser_id|integer||
|purchaser_id_status|integer||
|delivery_fee|string|null:false|
|prefecture_id|integer|null:false|
### Association
- belongs_to_active_hash :prefecture
- has_many :favorites, dependent: :destroy
- has_many :comments
- has_many :item_images
- accepts_nested_attributes_for :item_images, allow_destroy: true
- belongs_to :user, foreign_key: "buyer_id", class_name: "User",optional: true
- belongs_to :category, optional: true

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null:false, foreign_key: true|
|item_id|integer|null:false, foreign_key: true|
|message|text|null:false|
### Association
- belongs_to :user, optional: true
- belongs_to :item, optional: true

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
|image|string|null:false|
### Association
- belongs_to :item

## item_sizesテーブル
|Column|Type|Options|
|------|----|-------|
|item_size|string|null :false|
|ancestry|string||
### Association
- has_many :items
- has_many :category_sizes
- has_many :categories, through: :category_sizes
- has_ancestry

## credit_cardsデーブル
|Column|Type|Options|
|------|----|-------|
|customer_id|string|null: false|
|card_id|string|null :false|
|user_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user, optional true

## addressテーブル
|Column|Type|Options|
|------|----|-------|
|postalcode|integer|null: false|
|prefecture_id|integer|null: false|
|first_address|string|null: false|
|second_address|string|null: false|
|third_address|string||
|phone_number|integer||
|user_id|references||
### Association
- belongs_to :user, optional: true
- belongs_to_active_hash :prefecture

## categoryテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null :false|
|ancestry|string||
### Association
- has_many :items
- has_many :category_sizes
- has_many :item_sizes, through: :category_sizes
- has_ancestry

## category_sizeテーブル
|Column|Type|Options|
|------|----|-------|
|category_id|integer|null :false|
|item_size_id|integer|null :false|
### Association
- belongs_to :category
- belongs_to :item_size

## sns_credentialsテーブル
|Column|Type|Options|
|------|----|-------|
|provider|string||
|uid|string||
|user_id|bigint||
### Association
- belongs_to :user, optional: true
