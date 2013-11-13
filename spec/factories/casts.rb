# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :cast do
    movie nil
    person nil
    role "MyString"
  end
end
