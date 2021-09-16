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


## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| family_name        | string | null: false |
| first_name         | string | null: false |
| family_name_kana   | string | null: false |
| first_name_kana    | string | null: false |
| birth_day          | date   | null: false |

### Association

- has_many :orders
- has_many :products

## products テーブル

| Column             | Type      | Options                       |
| ------------------ | --------- | ----------------------------- |
| product_name       | string    | null: false                   |
| description        | text      | null: false                   |
| category           | string    | null: false                   |
| status             | string    | null: false                   |
| delivery_fee       | string    | null: false                   |
| area               | string    | null: false                   |
| arrival_date       | string    | null: false                   |
| price              | inteder   | null: false                   |
| user               | references| null: false,foreign_key: true |

### Association

- belongs_to :user
- has_one    :order

## order テーブル

| Column             | Type      | Options                       |
| ------------------ | --------- | ----------------------------- |
| user               | references| null: false,foreign_key: true |
| product            | references| null: false,foreign_key: true |
| information        | references| null: false,foreign_key: true |

### Association

- belongs_to :user
- belongs_to :product
- has_one    :information

| Column             | Type      | Options                       |
| ------------------ | --------- | ----------------------------- |
| postal_code        | string    | null: false                   |
| pretectures        | string    | null: false                   |
| city               | string    | null: false                   |
| address            | string    | null: false                   |
| building           | string    | null: false                   |
| telephone_number   | integer   | null: false                   |


### Association

- belongs_to :order