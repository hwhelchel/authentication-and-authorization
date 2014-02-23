FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "test#{n}@example.com" }
    password  "foobar"
    after(:build) { |user| user.hash_password(user.password) }
  end
end
