class User < ApplicationRecord
  has_many :items
  has_many :comments
  has_many :purchases
  has_one :address

  with_options presence: true do
    validates :nickname
    validates :password, format: {
      with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,}\z/i,
      message: 'invalid: alphabet and digit are only permitted and both required.'
    }
    validates :first_name, format: {
      with: /\A[ぁ-んァ-ン一-龥]+\z/, 
      message: "is invalid. Input full-width characters."
    }
    validates :last_name, format: {
      with: /\A[ぁ-んァ-ン一-龥]+\z/, 
      message: "is invalid. Input full-width characters."
    }
    validates :first_name_kana, format: {
      with: /\A[ァ-ヶー－]+\z/, 
      message: "is invalid. Input full-width katakana characters."
    }
    validates :last_name_kana, format: {
      with: /\A[ァ-ヶー－]+\z/, 
      message: "is invalid. Input full-width katakana characters."
    }
    validates :birthday
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
