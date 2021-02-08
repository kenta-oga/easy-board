# Easy Board

『あなたに必要な情報だけ届く、あなただけの掲示板』
Easy Boardは、パート・アルバイトの方も使いやすい、職場で使える掲示板アプリです！

### URL:  http://35.72.52.25/

### ローカルでの動作方法
% git clone https://github.com/kenta-oga/easy-board.git
% cd easy-board
% bundle install
% yarn install
% rails db:create
% rails db:migrate

### テストアカウント
email: gest@user
password: gest01

# 使用技術・環境
### 【フロントエンド】
- HTML<br>
- CSS<br>
- JavaScript<br>
- Action Cable</br>


### 【バックエンド】
- Ruby 2.6.5<br>
- Ruby on Rails 6.0.0<br>

### 【データベース】
- MySQL2 0.4.4<br>

### 【本番環境】
- AWS(S3/EC2)<br>
- Nginx、Unicorn<br>

### 【その他使用技術】
- Git,GitHub<br>
- RSpec<br>
- Rubocop<br>
- Capistrano<br>
- Bootstrap

# 目指した課題解決

### 対象の職場
- 店舗・工場などシフト制の職場
- 長時間稼働の職場(24時間稼働、夜勤有り等)

### ペルソナ
- 24時間稼働、シフト制の工場で働く夜勤のアルバイトスタッフ

### ペルソナの悩み
- 出勤時間が皆バラバラなので、上司からの連絡はノートを用いている。
- ノートには自分の担当ポジション以外への連絡も含まれるため、とても見づらい。
- 連絡事項が確認済みか否かがわかりにくい

### 連絡手段の代替案
**LINE** 

【メリット】
- 多くの人が使用経験があり、使いこなしている

【デメリット】
- プライベートで使用するため、仕事の連絡に使用することに抵抗感を持つ人がいる
- LINEを使用していない人には別の連絡手段を使わなければならない

**Slack**

【メリット】
- 仕事専用の用途で使用できる

【デメリット】
- アルバイトの方の中には多機能すぎて、使いづらいと感じる人がいる

### 解決したい課題
- 必要な情報だけを一人一人に届けたい
- 仕事の情報共有のみに使用できるサービスがほしい
- アルバイトの方にも使いやすい機能数のサービスがほしい

### 使用するメリット
【一般従業員】
- 自分に必要な情報のみ届くので、見やすい
- 仕事とプライベートで連絡ツールが異なるので、公私で気持ちを切り替えられる
- 必要な機能のみ備わっているので、機械に疎い人でも使いこなせる
- 各ポジション内の引き継ぎにも使用できる
- 未確認の投稿がわかりやすい

【マネージャー】
- ポジションごとに細かく連絡内容を分けられる
- グループメンバーの既読確認が容易にできる


# 利用方法

- 各部署、ポジションごとにグループを作成し、関連するメンバーをグループに追加する</br>(新規加入したユーザーは、上司が関連グループに追加をする)
- 連絡事項を関連グループに投稿する
- 新規投稿の内容を確認したユーザーは確認済みボタンを押し、確認の旨を報告
- 投稿に対してコメントがある場合はコメントを書き込む


# 機能一覧

### ユーザー機能
- ユーザー登録
- ログイン
- ユーザー編集

【ユーザー新規登録画面】
![38ec44769b59022459bcbd1eb59ffa70](https://user-images.githubusercontent.com/75552959/107181693-bac57d00-6a1e-11eb-87d1-452c10703f39.gif)


### グループ機能
- グループ新規作成
- グループ情報編集
- グループ一覧表示(ログインユーザーの所属グループのみ)


【グループ新規作成画面】
![7fe4b55ee2fa7aaa3b2338ff6952ed1a](https://user-images.githubusercontent.com/75552959/107184674-5f968900-6a24-11eb-8988-6818dd6520fc.gif)


### 情報投稿機能
- 投稿新規登録、編集、削除
- 画像投稿(active storage)
- 投稿一覧表示
- 投稿詳細表示

【新規投稿画面】
![d07443d7e1880214320a88b0735e1794](https://user-images.githubusercontent.com/75552959/107184865-b00de680-6a24-11eb-9ddc-99697095e28c.gif)

【投稿詳細画面】
![a27f0b45ec2eaf2822c1d24c83d183c9](https://user-images.githubusercontent.com/75552959/107185023-011dda80-6a25-11eb-9d77-c2bfb2b057f3.gif)


### コメント機能
- 投稿に対するコメントが可能
- 削除可能

【コメント機能】
![コメント機能](https://user-images.githubusercontent.com/75552959/107185285-87d2b780-6a25-11eb-95fc-b347d2c0331c.gif)

### 既読確認機能
- 投稿詳細ページに既読確認ボタン
- 確認ボタンを押すと確認済み一覧にユーザー名表示
- 確認済みの投稿は投稿一覧画面で色が変わる
- グループごとの未読の投稿数がグループ一覧に表示

【既読確認機能】
![227d39af3db19603ad13b5adbe2d8c8c](https://user-images.githubusercontent.com/75552959/107185522-fa439780-6a25-11eb-82b5-864c4f2c5489.gif)

【未読数の表示・既読済み投稿の背景色変更】
<img width="1438" alt="easy board未読数" src="https://user-images.githubusercontent.com/75552959/107223783-f2054f80-6a59-11eb-979a-87c426d3edf5.png">




# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| email    | string | null: false |
| password | string | null: false |

### Association

- has_many :group_users
- has_many :groups, through: group_users
- has_many :post
- has_many :comment
- has_many :reads

## groups テーブル

| Column   | Type    | Options     |
| -------- | ------- | ----------- |
| name     | string  | null: false |

### Association

- has_many :group_users
- has_many :users, through: group_users
- has_many :posts

## group_users テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| group  | references | null: false, foreign_key: true |

### Association

- belongs_to :group
- belongs_to :user

## posts テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| title   | string     | null: false                    |
| content | string     | null: false                    |
| user    | references | null: false, foreign_key: true |
| group   | references | null: false, foreign_key: true |

### Association

- belongs_to :group
- belongs_to :user
- has_many   :comments
- has_many   :reads

## comments テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| text   | string     | null: false                    |
| user   | references | null: false, foreign_key: true |
| post   | references | null: false, foreign_key: true |

### Association

- belongs_to :post
- belongs_to :user

## reads テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| post   | references | null: false, foreign_key: true |

### Association

- belongs_to :post
- belongs_to :user