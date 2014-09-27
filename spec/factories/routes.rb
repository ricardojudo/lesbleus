# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :route do
    name "MyString"
    
    factory :invalid_route do
      name nil
    end
  end
end
