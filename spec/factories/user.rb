FactoryBot.define do
  factory :user do
      name { 'test' }
      sequence(:email) { Faker::Internet.email }
      password {'20202020'}
      admin {"false"}
  end
  factory :second_user, class: User do
    name { 'test2' }
    sequence(:email) { Faker::Internet.email}
    password {'2222222'}
    admin {"false"}
  end
  factory :thrid_user, class: User do
    name { 'admin' }
    sequence(:email) { Faker::Internet.email }
    password {'aaaaaaa'}
    admin {"true"}
  end
end
