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

| Column             | Type    | Options                  |
| ------------------ | ------  | ------------------------ |
| name               | string  | null: false              |
| email              | string  | null: false, unique:true |
| password           | string  | null: false              |

### Association

- has_many :apps
- has_many :comments
- has_many :likes

## apps テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | -----------------------------  |
| user        | references | null: false, foreign_key: true |
| name        | string     | null: false                    |
| content     | text       | null: false                    |
| genre_id    | integer    | null: false                    |

### Association

- belongs_to :user
- has_many :comments
- has_many :likes
- belongs_to :genre

## comments テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | -----------------------------  |
| user        | references | null: false, foreign_key: true |
| app         | references | null: false, foreign_key: true |
| content     | text       | null: false                    |

### Association

- belongs_to :user
- belongs_to :app

## likes テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | -----------------------------  |
| user        | references | null: false, foreign_key: true |
| app         | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :app