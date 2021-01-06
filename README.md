# README

・アプリ名
　Makeme

・概要

　以下の機能を実装した「投稿アプリ」です。
　ーーーーーーーーーー
　アカウント登録
　ログイン/ログアウト
　プロフィール編集
　投稿編集
　投稿一覧
　投稿検索
　ブックマーク
　ーーーーーーーーーー
　
・本番環境
　Heroku

・制作背景　
　　お家時間が増えて「趣味がない、やりたいことが無い、、、」と呟く人が、
　　ワクワクする事に出会えるきっかけをつくれればと思い開発しました。

　　様々なユーザーがプランを作り「何か」を提案することで、
　　自分では思いもよらない「何か」と巡り会うことができる仕組みにしました。

　　閲覧者に行動を起こしてもらえるように、プランという形でやり方や費用がをまとめた情報にし、
　　「これなら挑戦しやすそうだな、やってみようかな」と思ってもらえるよう心がけて制作しました。
　　

・工夫したポイント
　○　ransackを用いて「カテゴリー、キーワード、時間、費用」など複数の要素で検索できるようにした。
　○　deviceを用いてユーザー管理登録の実装し、セキュリティを設けて安全に登録できるようにした。
　○　投稿情報・ブックマーク情報・アカウント情報のリンクを１ページでまとめて、編集削除できるページのリンクをまとめた。
　○　AWSのS3を使用して投稿画像が消えないように外部ストレージを設けた。
　○　Fontawaysomeを使って直感で機能がわかるようにした。


・使用技術(開発環境)
  ruby on rails	

・課題や今後実装したい機能	
　SNS連携をして利用者同士のマッチング機能を実装したい。　	


・DB設計						
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
| selecttime           | integer     | null: false       |
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