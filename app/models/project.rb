class Project < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: [:slugged, :finders]

  has_one :team, class_name: 'ProjectTeam'
  has_many :roles, through: :team

  after_create :create_team

  private
  def create_team
    self.create_team!
  end
end
