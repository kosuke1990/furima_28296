FactoryBot.define do
  factory :item do
  name                     { Faker::String.random(length: 10) }
  explanation              { Faker::String.random(length: 50) }
  category_id              { Faker::Number.between(from: 2, to:11) }
  status_id                { Faker::Number.between(from: 2, to:7) }
  who_cover_fee_id         { Faker::Number.between(from: 2, to:3) }
  where_delivery_from_id   { Faker::Number.between(from: 2, to:48) }
  how_long_id              { Faker::Number.between(from: 2, to:4) }
  price                    { Faker::Number.between(from: 300, to:9999999) } 
  end
end
