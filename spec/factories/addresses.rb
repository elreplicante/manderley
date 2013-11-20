# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :address do
    street Faker::Address.street_name
    number 24
    zipcode '12345'
  end
end
