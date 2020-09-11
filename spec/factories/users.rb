FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    family_name           { '岩倉' }
    first_name            { '玲音' }
    family_name_kana      { 'イワクラ' }
    first_name_kana       { 'レイン' }
    birthday              { '1998-11-26' }
  end
end
