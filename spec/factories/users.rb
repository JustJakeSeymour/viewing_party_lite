FactoryBot.define do
  factory :user do
    name { Faker::FunnyName.name }
    email { Faker::Internet.email } 
    password { Faker::Alphanumeric.alphanumeric(number: 8)}
  end
end