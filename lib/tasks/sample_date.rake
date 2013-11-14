namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do

    movie = {
        title: "Blade Runner",
        year: 1982,
        duration: 120,
        categories: "Sci-Fi, Drama",
        synopsis: Faker::Lorem.paragraph
    }
    
    20.times do |n|
      Movie.create!(movie)
      Person.create!(name: Faker::Name.first_name,
                    surname: Faker::Name.last_name
                    )
    end
  end
end