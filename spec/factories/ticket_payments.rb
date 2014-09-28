# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :ticket_payment do
    amount 100
    factory :invalid_ticket_payment do
      amount nil
    end
  end
end
