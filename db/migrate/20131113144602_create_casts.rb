class CreateCasts < ActiveRecord::Migration
  def up
    create_table :casts do |t|
      t.references :movie, index: true
      t.references :person, index: true
      t.string :role

      t.timestamps
    end

    Person.all.find_each do |person|
      Cast.create({ movie: person.movie, person: person })
    end
    remove_column :people, :movie_id
  end


  def down
    add_column :people, :movie_id, :string
    Cast.find_each do |c|
      c.person.movie = c.movie
      c.person.save
    end
    drop_table :casts
  end 
end

