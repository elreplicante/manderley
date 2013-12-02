class RemoveRoleFromPeople < ActiveRecord::Migration
  def change
    remove_column :people, :role, :string
  end
end
