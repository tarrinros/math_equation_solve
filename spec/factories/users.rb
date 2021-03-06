FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "tester#{n}@example.com" }

    after(:build) { |u| u.password_confirmation = u.password = 'mimba-tamba-shamba-zamba'}
  end
end
