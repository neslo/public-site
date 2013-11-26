class CreateAssignedRoles < ActiveRecord::Migration
  def change
    create_table :assigned_roles do |t|
      t.references :volunteer_role, index: true
      t.references :person, index: true

      t.timestamps
    end
  end
end
