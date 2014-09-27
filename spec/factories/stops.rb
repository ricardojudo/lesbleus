# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :stop do
    name {Faker::Name.first_name}
    latitude {Faker::Address.latitude}
    longitude {Faker::Address.longitude}
    
    factory :invalid_stop do
      name nil
      latitude nil
      longitude nil
    end
  
  end
end
