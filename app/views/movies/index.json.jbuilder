json.array!(@movies) do |movie|
  json.extract! movie, :title, :duration
  json.url movie_url(movie, format: :json)
end
