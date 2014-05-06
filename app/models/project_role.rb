class ProjectRole < ActiveRecord::Base
  belongs_to :project_team
  belongs_to :previous_person, class: Person
  belongs_to :person
end
