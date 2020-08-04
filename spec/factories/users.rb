FactoryBot.define do
  factory :user do
    nickname {Faker::Internet.username}
    email {Faker::Internet.email}
    password {Faker::Internet.password(
      min_length: 6, max_length: 20, mix_case: true
    )}
    password_confirmation {password}
    first_name {Gimei.last.kanji}
    last_name {Gimei.first.kanji}
    first_name_kana {Gimei.last.katakana}
    last_name_kana {Gimei.first.katakana}
    birthday {Faker::Date.in_date_period(year: 2000)}
  end
end
