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
