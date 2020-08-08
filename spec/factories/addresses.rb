FactoryBot.define do
  factory :address do
    head = Faker::Number.number(digits: 3)
    foot = Faker::Number.number(digits: 4)
    number = Faker::Address.zip_code

    postal_code   { "#{head}-#{foot}" }
    prefecture_id { Faker::Number.within(range: 1..47) }
    city          { Gimei.city.kanji }
    town          { Gimei.town.kanji + number }
    building_name { Gimei.city.katakana + number }
    phone         { Faker::Number.decimal_part(digits: 10) }

    association :user
  end
end
