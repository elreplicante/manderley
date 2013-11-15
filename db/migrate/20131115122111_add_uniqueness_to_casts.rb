class AddUniquenessToCasts < ActiveRecord::Migration
  def change
    add_index :casts, [:person_id, :movie_id, :role], :unique => true
  end
end
