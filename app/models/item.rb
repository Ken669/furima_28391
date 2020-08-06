class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :shipping_fee
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :shipping_schedule

  belongs_to :user
  has_one_attached :image
  has_many :comments
  has_one :purchase
  has_one :address

  validates :image, :name, :detail, presence: true

  with_options numericality: {
    other_than: 0,
    message: "can't be blank"
  } do
    validates :category_id
    validates :condition_id
    validates :shipping_fee_id
    validates :prefecture_id
    validates :shipping_schedule_id
  end

  validates :price, numericality: {
    greater_than_or_equal_to: 300,
    less_than_or_equal_to: 9_999_999,
    message: 'is out of setting range'
  }
  validates :price, format: {
    with: /\A[0-9]+\z/,
    message: 'is invalid. Input half-width characters.'
  }
  validates :price, presence: true
end
