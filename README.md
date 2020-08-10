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
| birthday_year      | int    | null: false | 
| birthday_month     | int    | null: false | 
| birthday_day       | int    | null: false | 
### Association
- has_many :items
- has_many :purchase_histories

## items テーブル
| Column              | Type   | Options                       | 
| ------------------- | ------ | ------------------------------| 
| user_id             | string | null: false, foreign_key: true| 
| item_image          | string | null: false                   | 
| item_name           | string | null: false                   | 
| explanation         | string | null: false                   | 
| category            | string | null: false                   | 
| status              | string | null: false                   | 
| who_cover_fee       | string | null: false                   | 
| where_delivery_from | string | null: false                   | 
| how_long            | string | null: false                   | 
| price               | int    | null: false                   | 
### Association
- belongs_to :user
- has_a :item_additional
- has_a :purchase_histories

## purchase_histories テーブル
| Column    | Type   | Options                        | 
| --------- | ------ | ------------------------------ | 
| user_id   | string | null: false, foreign_key: true | 
| item_id   | string | null: false, foreign_key: true | 
| item_name | string | null: false                    | 
| customer  | string | null: false                    | 
| price     | int    | null: false                    | 
| status    | string | null: false                    | 
### Association
- belongs_to :user
- belongs_to :items
- has_a :places

## item_additional テーブル
| Column     | Type   | Options                        | 
| ---------- | ------ | ------------------------------ | 
| item_id    | string | null: false, foreign_key: true | 
| comment    | string | null: true                     | 
| good_point | int    | null: true                     | 
### Association
- belongs_to :items

## item_additional テーブル
| Column              | Type   | Options                       | 
| ------------------- | ------ | ------------------------------| 
| purchase_history_id | string | null: false, foreign_key: true| 
| postal_code         | string | null: false                   | 
| prefectures         | string | null: false                   | 
| city                | string | null: false                   | 
| address             | string | null: false                   | 
| building            | string | null: false                   | 
| phone_number        | int    | null: false                   | 
### Association
- belongs_to :purchase_histories
