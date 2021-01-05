# README

・アプリ名

  Makeme



・概要

  「できる事・やりたい事」を探せる、投稿検索型アプリです。
  「できる事・やりたい事」は「プラン」と言い、投稿順に一覧で表示されています。
   全てのユーザーが、他のユーザーが投稿したプランを検索・閲覧することができます。
   カテゴリー検索・時間検索・キーワード検索など、複数の要素での検索ができます。
   ユーザー登録をすると、プランを作成・ブックマーク（保存）することができます。
   投稿プランの編集・削除・ブックマークの管理、登録したユーザー情報の変更・削除は、ユーザーページで行えます。

  

・本番環境

   Heroku
  


・ログイン：アドレス/パスワード

   アドレス_ test＠mail

   パスワード_ test1234


・制作背景(意図)						

  セルフプロデュースを手助けするツールとして開発。
  
  SNSの発達で、他人と自身を比較し人生に悩む人が増えています。
  また、コロナによりお家時間を有効に活用したいと考える人が増えています。

  そんな状況で悩むことから「何かやりたい、何か頑張りたい」と
  今の状況や自身に変化を与えたいという気持ち起きたとき、
  その「何」を探すお手伝いをします。

  誰でも情報が発信できるようになり、ネット上は不要な情報で溢れて探しにくくなっています。
  本アプリを通じて「プラン」という提案の形にまとめることで、「何」を簡単に見つけることを実現します。


・DEMO(gifで動画や写真を貼って、ビューのイメージを掴んでもらいます)						
⇒特に、デプロイがまだできていない場合はDEMOをつけることで見た目を企業側に伝えることができます。	

・工夫したポイント
 ransackを使用して検索項目を増やして検索機能を充実させて、ユーザーが欲しい情報を取得できやすいように実装した。
 マイページで、投稿情報・ブックマーク・ユーザー登録情報といった、全ての情報を管理できるようにまとめた。
 ユーザービリティーを考えてFont awesomeのアイコンを使用してどんな操作ができるか直感でわかるようにした。

・使用技術(開発環境)
  Rails on ruby
  My SQL
  Git

・課題や今後実装したい機能	
 今後は、各種SNSへの連携しマッチング機能を充実させていき、利用者同士が繋がる仕組みを実現したいと考えている。
 HTML・CSSをよりサイトイメージに近い洗練されたもの・操作が直感でわかるように改善する。


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
| selecttime_id        | integer     | null: false       |
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