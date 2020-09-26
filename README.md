# README

# テーブル設計

## users テーブル

| Column           | Type   | Options     |
|------------------|--------|-------------|
| nickname         | string | null: false |
| email            | string | null: false |
| password         | string | null: false |
| family_name      | string | null: false |
| first_name       | string | null: false |
| family_name_kana | string | null: false |
| first_name_kana  | string | null: false |
| birthday         | date   | null: false |

### Association

- has_many :items
- has_many :buys

## items テーブル

| Column                  | Type       | Options                        |
|-------------------------|------------|--------------------------------|
| name                    | string     | null: false                    |
| text                    | string     | null: false                    |
| category_id             | integer    | null: false                    |
| status_id               | integer    | null: false                    |
| shipping_charges_id     | integer    | null: false                    |
| shipping_prefectures_id | integer    | null: false                    |
| days_to_ship_id         | integer    | null: false                    |
| price                   | integer    | null: false                    |
| user                    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :buy

## buy テーブル

| Column        | Type       | Options                        |
|---------------|------------|--------------------------------|
| user          | references | null: false, foreign_key: true |
| item          | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## address テーブル

| Column         | Type       | Options                        |
|----------------|------------|--------------------------------|
| post_number    | string     | null: false                    |
| prefectures_id | integer    | null: false                    |
| city           | string     | null: false                    |
| house_number   | string     | null: false                    |
| building_name  | string     |                                |
| phone_number   | string     | null: false                    |
| buy            | references | null: false, foreign_key: true |

### Association
- belongs_to :buy