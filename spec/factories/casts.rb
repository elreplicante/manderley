FactoryGirl.define do
  factory :cast do
    association :movie
    association :person
    role "MyString"
  end
end
