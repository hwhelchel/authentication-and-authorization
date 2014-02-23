FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "test#{n}@example.com" }
    pass "foobar"
    after(:build) { |user| user.hash_password(user.pass) }
  end
end
