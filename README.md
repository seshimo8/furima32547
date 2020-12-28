# テーブル設計

## users テーブル

| Column        | Type   | Options     |
| --------      | ------ | ----------- |
| nickname      | string | null: false |
| email         | string | null: false |
| password      | string | null: false |
| first_name    | string | null: false |
| last_name     | string | null: false |
| date_of_birth | string | null: false |



### Association

- has_many :items
- has_many :buys

## items テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name   | string | null: false |
| text   | text   | null: false |
| price  | integer| null: false | 

### Association

- belongs_to :users
- has_one : buy
- has_many :messages

## buys テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addresses テーブル

| Column        | Type       | Options         |
| -------       | ---------- | --------------- |
| postal_code   | string     | null: false     |
| city          | string     | null: false     |
| house_number  | string     | null: false     |
| building_name | string     | null: false     |
| phone_number  | string     | null: false     |

### Association

- belongs_to :buy
