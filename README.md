# README

# テーブル設計
[ER図](https://drive.google.com/file/d/13lLvO5zMukS0yZRkVI7gEmbcjfn6I4kZ/view?usp=sharing)
## users テーブル
| Column             | Type   | Options     | 
| ------------------ | ------ | ----------- | 
| nickname           | string | null: false | 
| mail               | string | null: false | 
| password           | string | null: false | 
| first_name_zenkaku | string | null: false | 
| last_name_zenkaku  | string | null: false | 
| first_name_kana    | string | null: false | 
| last_name_kana     | string | null: false | 
| birthday           | date   | null: false | 
### Association
- has_many :items
- has_many :purchase_histories

## items テーブル
| Column              | Type       | Options                       | 
| ------------------- | ---------- | ------------------------------| 
| user                | references | null: false, foreign_key: true| 
| image               | string     | null: false                   | 
| name                | string     | null: false                   | 
| explanation         | text       | null: false                   | 
| price               | int        | null: false                   | 
### Association
- belongs_to :user
- has_one :item_additional
- has_one :purchase_history

## purchase_histories テーブル
| Column    | Type        | Options                        | 
| --------- | ----------- | ------------------------------ | 
| user      | references  | null: false, foreign_key: true | 
| item      | references  | null: false, foreign_key: true | 
### Association
- belongs_to :user
- belongs_to :item
- has_one :address

## item_additional テーブル
| Column     | Type       | Options                        | 
| ---------- | ---------- | ------------------------------ | 
| item       | references | null: false, foreign_key: true | 
| comment    | string     | null: true                     | 
| good_point | int        | null: true                     | 
### Association
- belongs_to :item

## address テーブル
| Column              | Type       | Options                       | 
| ------------------- | ---------- | ------------------------------| 
| purchase_history    | references | null: false, foreign_key: true| 
| postal_code         | string     | null: false                   | 
| city                | string     | null: false                   | 
| address             | string     | null: false                   | 
| building            | string     | null: true                    | 
| phone_number        | string     | null: false                   | 
### Association
- belongs_to :purchase_history
