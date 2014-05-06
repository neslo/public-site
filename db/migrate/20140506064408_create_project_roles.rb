class CreateProjectRoles < ActiveRecord::Migration
  def change
    create_table :project_roles do |t|
      t.belongs_to :project_team, index: true
      t.string :title
      t.string :overview
      t.text :description
      t.belongs_to :previous_person, index: true
      t.belongs_to :person, index: true

      t.timestamps
    end
  end
end
