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

# アプリケーション名
Fav App（ファボアップ）

# アプリケーション概要
- おすすめのアプリをユーザー同士でシェアし、コミュニケーションを図る
- 利用したことのないアプリに巡り会える

# URL


# テスト用アカウント
- Basic認証パスワード：
- Basic認証ID：
- メールアドレス：test@test
- パスワード：111aaa

# 利用方法
## おすすめアプリ投稿
1.トップページから「新規登録」を行う  
2.ヘッダーの「おすすめアプリ投稿」から「アプリ名」、「おすすめポイント」、「ジャンル」、「お気に入りシーン（画像）」を入力し「Post」ボタンをクリックする
## 投稿一覧と詳細を閲覧
1.ヘッダーの「投稿一覧」をクリックする  
2.投稿された内容をクリックし詳細ページに遷移する
## 投稿内容の編集と削除
自身が投稿した詳細ページに遷移する  
- 「編集」ボタンをクリックし、投稿内容編集後「Update」ボタンをクリックする  
- 「削除」ボタンをクリックする
## 「いいね」機能
1.詳細ページに遷移する  
2.「🤍」ボタンをクリックする  
## コメント機能
1.詳細ページに遷移する  
2.ページ下部のコメントフォームに文字を入力し、「コメント」ボタンをクリックする  
3.コメント一覧が同ページに表示され、コメントが閲覧できる
## 検索機能
1.  


# アプリケーションを作成した背景
- 同じアプリを利用している人とコミュニケーションを図る場が欲しい  
- 暇つぶしできるアプリを探す場が欲しい  
上記の課題から、「おすすめのアプリを投稿できる」、「投稿内容を閲覧できる」、「コメント機能やいいね機能がある」ことで課題を解決できると推測し、おすすめアプリを共有しコミュニケーションを促進できるSNSアプリケーションを開発することにした。

# 洗い出した要件
https://docs.google.com/spreadsheets/d/1L677pgABIyWOUPuCiYRJwLVfDAAAtKkaneg-77arrac/edit?usp=sharing

# 実装した機能についての画像およびその説明
#### 新規ユーザー登録画面
[![Image from Gyazo](https://i.gyazo.com/06e501f76a1299cf9324512ff5f9fba3.png)](https://gyazo.com/06e501f76a1299cf9324512ff5f9fba3)

#### ログイン画面
[![Image from Gyazo](https://i.gyazo.com/d568efd9811880e38295251783e3a414.png)](https://gyazo.com/d568efd9811880e38295251783e3a414)

#### おすすめアプリ投稿画面
[![Image from Gyazo](https://i.gyazo.com/1993523c1bc7b2064e2d7484174d0dfd.png)](https://gyazo.com/1993523c1bc7b2064e2d7484174d0dfd)

#### おすすめアプリ投稿一覧画面


#### おすすめアプリ詳細画面


# 実装予定の機能


# データベース設計
[![Image from Gyazo](https://i.gyazo.com/34dfcb20fd0be51f2168124b29fb6837.png)](https://gyazo.com/34dfcb20fd0be51f2168124b29fb6837)

# 画面遷移図
[![Image from Gyazo](https://i.gyazo.com/8367ae31ad1b36ad04349acc8ddd02b7.png)](https://gyazo.com/8367ae31ad1b36ad04349acc8ddd02b7)

# 開発環境
- フロントエンド：HTML、CSS
- バックエンド：Ruby、JavaScript
- データベース：MySQL
- インフラ：render
- テスト：RSpec
- 外部サービス、タスク管理：GitHub
- テキストエディタ

# ローカルでの動作方法


# 工夫したポイント
- サイトの見た目作りです。第一印象で見にくいと感じないよう、余白に気をつけて制作しました（書籍「けっきょく、よはく」参考）
- 任意のアクションを追加したことです。テックキャンプではrailsに定義されている7つのアクションのみ使用しておりました。トップページを制作したかったので、ネットで検索し自力で実装しました。






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