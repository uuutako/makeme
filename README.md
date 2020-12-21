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

| Column               | Type       | Options        |
| -------------------- | ---------- | -------------- |
| name                 | string     | unique: true   |
| email                | string     | unique: true   |
| password             | string     | unique: true   |


### Association
  has_many    :plans
  has_many    :likes



## plan テーブル

| Column               | Type        | Options           |
| -------------------- | ----------- | ----------------- |
| title                | string      | null: false       |
| concept              | text        | null: false       |
| item                 | text        | null: false       |
| cost                 | integer     | null: false       |
| process              | text        | null: false       |
| hour                 | integer     | null: false       |
| minute               | integer     | null: false       |
| timezone_id          | integer     | null: false       |
| place                | string      | null: false       |
| category_id          | integer     | null: false       |
| user                 | references  | foreign_key: true |  


### Association

- belongs_to    :user
- has_many      :comments
  has_many      :likes

### category テーブル

| Column      | Type       | Options           |
| ----------- | ---------- | ----------------- |
| plan        | references | foreign_key: true |
| user        | references | foreign_key: true |

### Association
- has_many : plans