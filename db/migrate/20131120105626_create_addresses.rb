class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|

      t.string :street
      t.integer :number
      t.string :zipcode

      t.timestamps
    end
  end
end
