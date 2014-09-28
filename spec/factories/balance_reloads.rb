# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :balance_reload do
    amount 100
    pay_pal_tx 'pp123456789'

    factory :invalid_balance_reload do
      amount nil
    end

  end
end
