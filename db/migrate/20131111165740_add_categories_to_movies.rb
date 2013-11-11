class AddCategoriesToMovies < ActiveRecord::Migration
  def change
    add_column :movies, :categories, :string
  end
end
