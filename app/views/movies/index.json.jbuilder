json.array!(@movies) do |movie|
  json.extract! movie, :title, :duration, :synopsis, :year, :categories
  json.url movie_url(movie, format: :json)
end
