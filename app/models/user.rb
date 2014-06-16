class User < ActiveRecord::Base
  include Gravtastic
  has_gravatar :rating => 'PG'

  ROLES = %w(user admin)
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name
  
  has_one :project, :dependent => :destroy
  has_many :project_collaborators, :dependent => :destroy
  has_many :projects, :through => :project_collaborators, :uniq => true

  validates_inclusion_of :role, :in => ROLES, :allow_blank => true
  validates_presence_of :name
  
  # include Forem::DefaultPermissions
  
  def to_s
    name
  end
  
  def project
    collaborator = project_collaborators.owners.first
    collaborator.project if collaborator
  end
  
  def communities
    projects.map(&:communities).flatten.uniq
  end
end
