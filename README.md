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
- has_many :order
- has_many :items

## items テーブル

| Column           | Type    | Options                        |
| ---------------- | ------- | ------------------------------ |
| name             | string  | null: false                    |
| price            | integer | null: false                    |
| comment          | text    | null: false                    |
| shipping_cost    | integer | null: false, active_hash       |
| shipping_days    | integer | null: false, active_hash       |
| shipping_state   | integer | null: false, active_hash       |
| shipping_origin  | integer | null: false, active_hash       |
| category         | integer | null: false, active_hash       |
| user_id          | integer | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :order

## order テーブル

| Column           | Type    | Options                        |
| ---------------- | ------- | ------------------------------ |
| user_id          | integer | null: false, foreign_key: true |
| item_id          | integer | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addresses テーブル

| Column           | Type    | Options                        |
| ---------------- | ------- | ------------------------------ |
| postal_code      | string  | null: false                    |
| prefectures      | integer | null: false, active_hash       |
| city             | string  | null: false                    |
| address          | string  | null: false                    |
| building         | string  |                                |
| phone_number     | string  | null: false                    |
| purchaser_id     | integer | null: false, foreign_key: true |
### Association

- belongs_to :order
