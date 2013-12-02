class DeleteRoleFromPerson < ActiveRecord::Migration
  def change
    remove_column :people, :role
  end
end
