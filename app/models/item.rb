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
  has_one :purchase, :address

  validates :name, :detail, presence: true

  with_options numericality: {
    other_than: 0,
    message: "can't be blank"
  } do
    validates :category
    validates :condition
    validates :shipping_fee
    validates :prefecture
    validates :shipping_schedule
  end

  validates :price, numericality: {
    greater_than_or_equal_to: 300,
    less_than_or_equal_to: 9999999,
    message: "is out of setting range"
  }
  validates :price, format: {
    with: /\A[0-9]+\z/, 
    message: "is invalid. Input half-width characters."
  }
  validates :price, presence: true
end
