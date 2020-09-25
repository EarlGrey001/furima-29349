FactoryBot.define do
  factory :item_donation do
    user_id { 1 }
    item_id { 3 }
    token { 'tok_236bfa692f430172369f95986238' }
    postal_code { '123-4567' }
    area_id { 10 }
    city { '東京都' }
    address { '1-1' }
    building { '東京ハイツ' }
    phone_number { '0286631932' }
  end
end
