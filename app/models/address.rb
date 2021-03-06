class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

  belongs_to :user

  with_options presence: true do
    validates :postal_code, format: {
      with: /\A\d{3}-\d{4}\z/,
      message: 'only permits digits or requires hyphen(-).'
    }
    validates :city, format: {
      with: /\A[ヶ々ァ-ンぁ-ん一-龥]+\z/,
      message: 'only permits かな・カナ・漢字.'
    }
    validates :town, format: {
      with: /\A[−ヶ々ァ-ンぁ-ん一-龥１-９ー\d-]+\z/,
      message: 'prohibites alphabetic letters.'
    }
    validates :phone, format: {
      with: /\A\d{10,11}\z/,
      message: 'permits 10 or 11 digits only.'
    }
  end

  validates :prefecture_id, numericality: {
    other_than: 0,
    message: "can't be blank."
  }
end
