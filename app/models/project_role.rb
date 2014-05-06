class ProjectRole < ActiveRecord::Base
  belongs_to :team, class_name: 'ProjectTeam', foreign_key: 'project_team_id'
  belongs_to :previous_person, class_name: "Person"
  belongs_to :person
  has_one :project, through: :team

  validates_presence_of :team
end
