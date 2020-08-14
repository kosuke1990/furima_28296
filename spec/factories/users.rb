FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 4)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    first_name_zenkaku    {Gimei.first.kanji}
    last_name_zenkaku     {Gimei.last.kanji}
    first_name_kana       {Gimei.first.katakana}
    last_name_kana        {Gimei.last.katakana}
    birthday              {Faker::Date.in_date_period}
  end
end