FactoryBot.define do
  factory :user do
      name { 'test' }
      sequence(:email) { |n| "tester13#{n}@example.com" }
      password {'20202020'}
      admin {"false"}
  end
  factory :second_user, class: User do
    name { 'test2' }
    sequence(:email) { |n| "testers13#{n}@example.com" }
    password {'2222222'}
    admin {"false"}
  end
  factory :thrid_user, class: User do
    name { 'admin' }
    sequence(:email) { |n| "admin_tester8#{n}@example.com" }
    password {'aaaaaaa'}
    admin {"true"}
  end
end
