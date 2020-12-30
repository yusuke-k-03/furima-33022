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

| Colum             | Type    | Options       |
|-------------------|---------|-------------- |
| nickname          | string  | null: false   |
| email             | string  | null: false   |
| password          | string  | null: false   |
| last-name         | string  | null: false   |
| first-name        | string  | null: false   |
| last-name-kana    | string  | null: false   |
| first-name-kana   | string  | null: false   |
| birth-date        | date    | null: false   |

### Association

- has_many :items
- has_one :order

## items テーブル

| Colum                      | Type        | Options
| ---------------------------|-------------|---------------------------------|
| item-name                  | string      | null: false                     |
| item-info                  | string      | null: false                     |
| item-category              | string      | null: false                     |
| tem-sales-status           | string      | null: false                     |
| item-shipping-fee-status   | string      | null: false                     |
| item-prefecture            | string      | null: false                     |
| item-scheduled-delivery    | string      | null: false                     |
| item-price                 | numeric     | null: false                     |
| user                       | references  | null: false, foreign_key: true  |

### Association

- belongs_to :user
- has_one :order

## orders テーブル

| Colum           | Type        | Options                         |
| ----------------|-------------|---------------------------------|
| card-number     | numeric     | null: false                     |
| card-exp-month  | numeric     | null: false                     |
| card-exp-year   | numeric     | null: false                     |
| card-cvc        | numeric     | null: false                     |
| postal-code     | numeric     | null: false                     |
| prefecture      | string      | null: false                     |
| city            | string      | null: false                     |
| addresses       | string      | null: false                     |
| building        | string      |                                 |
| phone-number    | string      | null: false                     |
| user            | references  | null: false, foreign_key: true  |
| item            | references  | null: false, foreign_key: true  |

### Association

- belongs_to :user
- belongs_to :item