json.array!(@movies) do |movie|
  json.extract! movie, :title, :duration, :synopsis, :year
  json.url movie_url(movie, format: :json)
end
