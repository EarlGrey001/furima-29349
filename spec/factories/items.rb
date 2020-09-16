FactoryBot.define do
  factory :item do
    name                  {"PC"}
    price                 {100000}
    comment               {"macbook-air"}
    shipping_cost_id      {3}
    shipping_days_id      {3}
    shipping_state_id     {3}
    shipping_origin_id    {3}
    category_id           {3}

    association :user
    
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end

