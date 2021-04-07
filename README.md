# table設計

## users table

| column     | type   | options     |
|-----------------------------------|
| email      | string | null: false |
| password   | string | null: false |
| name       | string | null: false |
| profile    | text   | null: false |
| occupation | text   | null: false |
| position   | text   | null: false |

### Association

- has_many :prototypes
- has_many :comments

## prototypes table

| column     | type       | options                        |
|----------------------------------------------------------|
| title      | string     | null: false                    |
| catch_copy | text       | null: false                    |
| concept    | text       | null: false                    | 
| user       | references | null: false, foreign_key: true |
| image      | ActiveStorageで実装                          |

### Association
- has_many :comments
- belongs_to :user
- has_one_attached :image

## comments table

| columns   | type       | options                        |
|---------------------------------------------------------|
| text      | text       | null: false                    |
| user      | references | null: false, foreign_key: true |
| prototype | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :prototype
