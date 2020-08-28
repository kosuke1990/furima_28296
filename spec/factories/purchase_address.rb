FactoryBot.define do
  factory :purchase_address do
    postal_code { '123-4567' }
    prefecture_id { 2 }
    city { '東京都' }
    address {'青山1-1-1'}
    building { '東京ハイツ' }
    phone_number { '08012341234' }
  end
end