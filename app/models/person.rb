class Person < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :assigned_roles, dependent: :destroy
  has_many :volunteer_roles, through: :assigned_roles
  has_one :profile

  has_many :project_roles
  has_many :projects, through: :project_roles

  validates_presence_of :first_name, :last_name, :email, :phone, :postcode
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  validates_length_of :postcode, is: 4
  validates_uniqueness_of :email

  def full_name
    "#{first_name} #{last_name}"
  end
end
