# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :bus do
    name "0001"
    bid "00000000-0000-0000-0000-000000006669"
    factory :invalid_bus do
      name nil
      bid nil
    end
  end
end
