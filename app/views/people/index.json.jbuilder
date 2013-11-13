json.array!(@people) do |person|
  json.extract! person, :name, :surname, :movie_id
  json.url person_url(person, format: :json)
end
