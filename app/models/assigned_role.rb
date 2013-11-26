class AssignedRole < ActiveRecord::Base
  belongs_to :volunteer_role
  belongs_to :person
end
