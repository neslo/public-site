class ProjectTeam < ActiveRecord::Base
  belongs_to :project
  has_many :roles, class_name: 'ProjectRole'
end
