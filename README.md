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

| Colum               | Type    | Options       |
|---------------------|---------|-------------- |
| nickname            | string  | null: false   |
| email               | string  | null: false   |
| encrypted_password  | string  | null: false   |
| last-name           | string  | null: false   |
| first-name          | string  | null: false   |
| last-name-kana      | string  | null: false   |
| first-name-kana     | string  | null: false   |
| birth-date          | date    | null: false   |

### Association

- has_many :items
- has_many :record

## items テーブル

| Colum                         | Type        | Options
| ------------------------------|-------------|---------------------------------|
| name                          | string      | null: false                     |
| info                          | string      | null: false                     |
| category_id                   | integer     | null: false                     |
| sales-status_id               | integer     | null: false                     |
| shipping-fee-status_id        | integer     | null: false                     |
| prefecture_id                 | integer     | null: false                     |
| scheduled-delivery_id         | integer     | null: false                     |
| price                         | integer     | null: false                     |
| user                          | references  | null: false, foreign_key: true  |

### Association

- belongs_to :user
- has_one :record

## orders テーブル

| Colum           | Type        | Options                         |
| ----------------|-------------|---------------------------------|
| postal-code     | string      | null: false                     |
| prefecture_id   | integer     | null: false                     |
| city            | string      | null: false                     |
| addresses       | string      | null: false                     |
| building        | string      |                                 |
| phone-number    | string      | null: false                     |

### Association

- belongs_to :record

## records テーブル

| Colum     | Type        | Options                         |
| ----------|-------------|---------------------------------|
| user      | reference   | null: false, foreign_key: true  |
| item      | reference   | null: false, foreign_key: true  |

### Association

- has_one :order
- belongs_to :user
- belongs_to :item