class AddCommentsCountToMovies < ActiveRecord::Migration
  def change
    add_column :movies, :comments_count, :integer
  end
end
