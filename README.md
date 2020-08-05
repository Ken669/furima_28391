# table design

## users table

| Column             | Type   | Options     |
| --------           | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| password           | string | null: false |
| first_name         | string | null: false |
| last_name          | string | null: false |
| first_name_kana    | string | null: false |
| last_name_kana     | string | null: false |
| birthday           | date   | null: false |

### Association
- has_many :items
- has_many :comments
- has_many :purchases
- has_one :address


## items table

| Column            | Type    | Options     |
| --------          | ------  | ----------- |
| name              | string  | null: false |
| detail            | text    | null: false |
| category          | integer | null: false |
| condition         | integer | null: false |
| shipping_fee      | integer | null: false |
| shipping_from     | integer | null: false |
| shipping_schedule | integer | null: false |
| price             | integer | null: false |
| user           | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one_attached :image(active storage)
- has_many :comments
- has_one :purchase
- has_one :address

#### ActiveHash
:category, :condition, :shipping_fee, :shipping_from, :shipping_schedule


## comments table

| Column   | Type    | Options     |
| -------- | ------  | ----------- |
| comment  | text    | null: false |
| item  | references | null: false, foreign_key: true |
| user  | references | null: false, foreign_key: true |

### Association
- belongs_to :item
- belongs_to :user


## purchases table

| Column     | Type       | Options     |
| --------   | ------     | ----------- |
| item       | references | null: false, foreign_key: true |
| user       | references | null: false, foreign_key: true |

### Association
- belongs_to :item
- belongs_to :user


## addresses table

| Column        | Type    | Options     |
| --------      | ------  | ----------- |
| postal_code   | string  | null: false |
| prefecture    | integer | null: false |
| city          | string  | null: false |
| town          | string  | null: false |
| building_name | string  |             |
| phone         | string  | null: false |
| user       | references | null: false, foreign_key: true |

### Association
- belongs_to :user

#### ActiveHash
:prefecture
