ActiveAdmin.register ProjectRole do
  permit_params :title, :project_team_id, :overview, :description, :person_id, :previous_person_id
end
