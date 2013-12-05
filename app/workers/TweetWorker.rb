class TweetWorker
  include Sidekiq::Worker

  def perform(movie_id, user_id)
    movie = Movie.find(movie_id)
    user = User.find(user_id)
    post_tweet(user, movie)
  end

  def post_tweet(user, movie)
    puts "#{user.email} thinks #{movie.title} is amaaaaaazing!"
  end
end