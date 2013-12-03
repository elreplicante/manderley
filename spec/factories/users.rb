FactoryGirl.define do
  factory :user do
    email Faker::Internet.email
    trait :admin do
      after(:create, :build) do |user|
        user.add_role(:admin)
      end
    end
  end
end
