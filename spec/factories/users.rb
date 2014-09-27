# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    first_name {Faker::Name.name}
    last_name {Faker::Name.name}
    email {Faker::Internet.free_email}
    password '12345678'
  
    factory :invalid_user do
      first_name nil
    end
  end
end
