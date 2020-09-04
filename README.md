# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


# テーブル設計

## users テーブル

| Column           | Type   | Options     |
| ---------------- | ------ | ----------- |
| name             | string | null: false |
| email            | string | null: false |
| password         | string | null: false |
| family_name      | string | null: false |
| first_name       | string | null: false |
| family_name kana | string | null: false |
| first_name kana  | string | null: false |
| birthday         | date   | null: false |

### Association
- has_many :purchasers
- has_many :items

## items テーブル

| Column           | Type    | Options                        |
| ---------------- | ------- | ------------------------------ |
| name             | string  | null: false                    |
| price            | integer | null: false                    |
| comment          | text    | null: false                    |
| shipping_cost    | string  | null: false, active_hash       |
| shipping_days    | string  | null: false, active_hash       |
| shipping_state   | string  | null: false, active_hash       |
| shipping_origin  | string  | null: false, active_hash       |
| category         | string  | null: false                    |
| user_id          | integer | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchaser

## purchasers テーブル

| Column           | Type   | Options                        |
| ---------------- | ------ | ------------------------------ |
| user_id          | string | null: false, foreign_key: true |
| item_id          | string | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to_active_hash :item
- has_one :address

## addresses テーブル

| Column           | Type   | Options                        |
| ---------------- | ------ | ------------------------------ |
| postal_code      | string | null: false                    |
| prefectures      | string | null: false, active_hash       |
| city             | string | null: false                    |
| address          | string | null: false                    |
| building         | string |                                |
| phone_number     | string | null: false                    |
| user_id          | string | null: false, foreign_key: true |
### Association

- belongs_to :purchaser
