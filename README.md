# My Sweet Baby Girl

## 概要
このアプリケーションは、子供の写真を投稿するものです。  
夫婦と夫婦の両家（パパ実家、ママ実家）の合計3つのページがありますが一度の投稿で全てのページに投稿することが出来ます。  
それぞれの写真にコメントすることも出来ます。  

## URL
https://original-app-35238.herokuapp.com/

## テスト用アカウント
Email:papa@email  
password:111111

## 制作の背景
普段娘の写真を共有するためのアプリを使用しているのですが、複数のページに同時投稿する機能が付いておらず夫婦のページ、私の実家ページ、妻の実家ページと合計3回投稿するのが毎回大変なので、この問題を解消するアプリケーションを自分で制作してみたいと思いました。  
写真毎に、そのときの様子や子供の発した言葉、見た感想などを共有するためコメント機能も設け、相互のコミュニケーションの活性にも役立てました。

## 利用方法
ログインしたら、投稿ボタンから写真を投稿することが出来ます。  
新規登録する時は、新規登録ボタンを押して新規登録ページでニックネーム（6文字以内）、Eメールアドレス、パスワード、パスワード（確認用）の入力が必須です。  
投稿する際は、写真の説明、公開範囲、画像の添付が必須です。  
ログイン状態でないと写真の投稿は出来ません。  
自分の写真であれば投稿者は編集、削除が出来ます。  
他人が投稿した写真に対して編集、削除は出来ません。  
  


## DEMO
### トップページ  
娘の写真を投稿するので、出来るだけ可愛らしい見た目になる様に  
配色の組み合わせや、アイコンを利用するなど工夫しました。

<img width="716" alt="スクリーンショット 2021-05-07 17 50 01" src="https://user-images.githubusercontent.com/81006103/117790037-ece7b480-b283-11eb-9fc5-bf9687ba0306.png">  

### 新規投稿画面  
下記の投稿画面で投稿範囲をクリックすると、もう一つ下の画像の様に公開範囲が選べます。
<img width="851" alt="スクリーンショット 2021-05-11 18 17 20" src="https://user-images.githubusercontent.com/81006103/117791526-62a05000-b285-11eb-800f-ffa3fffc4b8c.png">  
<img width="736" alt="スクリーンショット 2021-05-08 21 22 07" src="https://user-images.githubusercontent.com/81006103/117791704-8ebbd100-b285-11eb-8b7d-c9a12b37a2ac.png">  

### 編集・削除・コメント機能
下記の画像の様に、投稿者のみ編集・削除ボタンが表示されます。  
またログインしているユーザーであれば誰でもコメントが出来ます。  
<img width="847" alt="スクリーンショット 2021-05-11 18 15 22" src="https://user-images.githubusercontent.com/81006103/117792109-f114d180-b285-11eb-87c8-efd462aacda8.png">



## 工夫した点
１番の目的だった同時投稿機能は、ActiveHashを利用して投稿時に公開範囲を選択できる様にしました。  
選択した公開範囲のidを、コントローラーのアクション内でwhereメソッドで取得し、それぞれのビューに表示するようにしました。  
少しでも可愛く見えるようにフォントを変えたり、アイコンを利用しました。  

## 使用技術（開発環境）
### バックエンド
Ruby, Ruby on rails  

### フロントエンド
HTML, CSS, JavaScript

### データベース
MySQL, SequelPro

### ソース管理
GitHub, GitHubDesktop

### エディタ
VSCode

## 洗い出した要件
| 機能                     | 詳細                   |
| ----------------------- | -------------------------------------------- |
| ユーザー管理機能（新規登録） | アドレスとパスワードでログインできる機能 |
| ユーザー管理機能（ログイン） | ニックネーム、アドレス、パスワードで新規登録できる機能 |
| 投稿機能                 | 登録しているユーザーであれば、投稿できる機能     |
| 全家族同時投稿機能         | 一度の投稿で合計３ページ同時に投稿することができる機能  |
| 一覧表示機能              | 投稿写真の一覧が表示される機能で、新しい投稿が上に来るように表示されます |
| 削除機能                 | 投稿者であれば投稿写真を削除できる機能  |
| 編集機能                 | 投稿者であれば投稿写真の内容を編集できる機能 |
| 詳細機能                 | 投稿写真のコメントが見えるページで、このページに削除、編集ボタンも配置されています  |
| コメント機能              | 投稿者以外でもログインしているユーザーであれば投稿写真にコメントできる機能  |
| 検索機能                  | 投稿写真のコメントに含まれている文字を検索できる機能 |

## 実装予定の機能
複数枚画像投稿機能  
複数枚の画像スライド表示機能  
いいね機能  
カレンダー機能


# データベース設計

![ER](https://user-images.githubusercontent.com/81006103/117392420-0360d980-af2d-11eb-9b50-b63b6694c68f.png)


# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |

### Association
- has_many :pictures
- has_many :comments

## pictures テーブル

| Column       | Type      | Options                        |
| ------------ | --------- | ------------------------------ |
| description  | text      | null: false                    |
| family_id    | integer   | null: false                    |
| user         | reference | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_many :comments

## comments テーブル

| Column    | Type      | Options                        |
| --------- | --------- | ------------------------------ |
| text      | text      | null: false                    |
| user      | reference | null: false, foreign_key: true |
| picture   | reference | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :picture
