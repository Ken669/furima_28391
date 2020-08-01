# table design

## users table

| Column             | Type   | Options     |
| --------           | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| password           | string | null: false |
| family_name        | string | null: false |
| personal_name      | string | null: false |
| family_name_kana   | string | null: false |
| personal_name_kana | string | null: false |
| birth_year         | integer | null: false |
| birth_month        | integer | null: false |
| birth_date         | integer | null: false |

### Association
- has_many :items
- has_many :comments
- has_many :transactions


## items table

| Column            | Type   | Options     |
| --------          | ------ | ----------- |
| name              | string | null: false |
| detail            | text   | null: false |
| category          | integer | null: false |
| condition         | integer | null: false |
| shipping_fee      | integer | null: false |
| shipping_from     | integer | null: false |
| shipping_schedule | integer | null: false |
| price             | integer | null: false |
| user_id           | integer | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one_attached :image(active storage)
- has_many :comments
- has_one :transaction

#### ActiveHash
:category, :condition, :shipping_fee, :shipping_from, :shipping_schedule


## comments table

| Column   | Type    | Options     |
| -------- | ------  | ----------- |
| comment  | text    | null: false |
| item_id  | integer | null: false, foreign_key: true |
| user_id  | integer | null: false, foreign_key: true |

### Association
- belongs_to :item
- belongs_to :user


## transactions table

| Column        | Type    | Options     |
| --------      | ------  | ----------- |
| price         | integer | null: false |
| postal_code   | string  | null: false |
| prefecture    | integer | null: false |
| city          | string  | null: false |
| street        | string  | null: false |
| building_name | string  |             |
| phone         | integer | null: false |
| item_id  | integer | null: false, foreign_key: true |
| user_id  | integer | null: false, foreign_key: true |

### Association
- belongs_to :item
- belongs_to :user
