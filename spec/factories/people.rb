FactoryGirl.define do
  factory :person do
    name "Antonio"
    surname "Resines"
    association :movie
  end
end
