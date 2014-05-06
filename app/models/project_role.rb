class ProjectRole < ActiveRecord::Base
  belongs_to :team, class_name: 'ProjectTeam', foreign_key: 'project_team_id'
  belongs_to :previous_person, class_name: "Person"
  belongs_to :person
  has_one :project, through: :team

  validates_presence_of :team

  def tap_on(person)
    update_attribute(:person, person)
  end

  def tap_off(person)
    update_attribute(:previous_person, person)
    update_attribute(:person, nil)
  end

  def can_tap_on?(user)
    if person.nil? && team.roles.where(person: user).count != 1
      true
    end
  end

  def can_tap_off?(user)
    if person == user
      true
    end
  end
end
