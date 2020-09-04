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

### Association
- has_one  :cards
- has_one  :purchasers
- has_many :items

## items テーブル

| Column           | Type   | Options                        |
| ---------------- | ------ | ------------------------------ |
| name             | string | null: false                    |
| price            | string | null: false                    |
| comment          | string | null: false                    |
| shipping_cost    | string | null: false                    |
| shipping_days    | string | null: false                    |
| category         | string | null: false                    |
| bland            | string | null: false                    |
| image            | string | null: false                    |
| user_id          | string | null: false, foreign_key: true |

### Association

- belongs_to :users
- belongs_to :addresses

## purchasers テーブル

| Column | Type       | Options     |
| ------ | ---------- | ----------- |
| user   | references | null: false |
| room   | references | null: false |

### Association

- belongs_to :users

## addresses テーブル

| Column           | Type   | Options     |
| ---------------- | ------ | ----------- |
| postal_code      | string | null: false |
| prefectures      | string | null: false |
| city             | string | null: false |
| address          | string | null: false |
| building         | string | null: false |
| phone_number     | string | null: false |
### Association

- has_many :items

## cards テーブル

| Column   | Type   | Options                        |
| -------- | ------ | ------------------------------ |
| user_id  | string | null: false, foreign_key: true |
| period   | string | null: false                    |
| card_id  | string | null: false                    |

### Association

- belongs_to :users