json.array!(@movies) do |movie|
  json.extract! movie, :title, :duration, :synopsis
  json.url movie_url(movie, format: :json)
end
