# テーブル設計

## usersテーブル

| Column     | Type   | Options     |
| ---------  | ------ | ----------- |
| email      | string | null: false |
| password   | string | null: false |
| name       | string | null: false |
| profile    | text   | null: false |
| ossupation | text   | null: false |
| position   | text   | null: false |

### Association
- has_many :prototypes
- has_many :comments


## prototypesテーブル

| Column     | Type       | Options     |
| ---------- | ---------- | ----------- |
| title      | string     | null: false |
| catch_copy | string     | null: false |
| concept    | text       | null: false |
| user       | references |

| image | Implemented with Active Storage | 

### Association
- belongs_to :users
- has_many :comments


## commentsテーブル

| Column    | Type       | Options     |
| --------- | ---------- | ----------- |
| user      | text       | null: false |
| text      | references |
| prototype | references |

### Association
- belongs_to :users
- belongs_to :prototypes