class Project < ActiveRecord::Base
  has_one :team, class_name: ProjectTeam
  has_many :roles, class_name: ProjectRole, through: :team
end
