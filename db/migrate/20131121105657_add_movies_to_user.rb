class AddMoviesToUser < ActiveRecord::Migration
  def change
    add_column :movies, :user_id, :integer, references: :user
  end
end
