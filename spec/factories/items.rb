FactoryBot.define do
  factory :item do
    name                  { 'PC' }
    price                 { 100_000 }
    comment               { 'macbook-air' }
    cost_id      { 3 }
    day_id      { 3 }
    state_id     { 3 }
    area_id    { 3 }
    category_id           { 3 }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
