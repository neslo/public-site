class CreateProjectTeams < ActiveRecord::Migration
  def change
    create_table :project_teams do |t|
      t.belongs_to :project, index: true

      t.timestamps
    end
  end
end
