# README

# テーブル設計

## users テーブル

| Column         | Type   | Options     |
|----------------|--------|-------------|
| nickname       | string | null: false |
| email          | string | null: false |
| password       | string | null: false |
| user-name      | string | null: false |
| user-name-kana | string | null: false |
| birthday       | string | null: false |

### Association

- has_many :items
- has_one :buy

## items テーブル

| Column               | Type       | Options                        |
|----------------------|------------|--------------------------------|
| image                | string     | null: false                    |
| item-name            | string     | null: false                    |
| item-text            | string     | null: false                    |
| item-category        | string     | null: false                    |
| item-status          | string     | null: false                    |
| shipping-charges     | string     | null: false                    |
| shipping-prefectures | string     | null: false                    |
| days-to-ship         | string     | null: false                    |
| item-price           | string     | null: false                    |
| user                 | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :buy

## buy テーブル

| Column        | Type       | Options                        |
|---------------|------------|--------------------------------|
| card-number   | string     | null: false                    |
| month         | string     | null: false                    |
| year          | string     | null: false                    |
| security-cord | string     | null: false                    |
| user          | references | null: false, foreign_key: true |
| item          | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## address テーブル

| Column        | Type       | Options                        |
|---------------|------------|--------------------------------|
| post-number   | string     | null: false                    |
| prefectures   | string     | null: false                    |
| city          | string     | null: false                    |
| house-number  | string     | null: false                    |
| building-name | string     | null: false                    |
| phone-number  | string     | null: false                    |
| buy           | references | null: false, foreign_key: true |

### Association
- belongs_to :buy