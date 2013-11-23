namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do    
    20.times do |n|
      Person.create!(
        name: Faker::Name.first_name,
        surname: Faker::Name.last_name
        )
    end
  end
end