class User < ActiveRecord::Base
  include Gravtastic
  has_gravatar :rating => 'PG'

  ROLES = %w(user admin)
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  
  has_one :project, :dependent => :destroy
  
  attr_accessible :name
  
  validates_inclusion_of :role, :in => ROLES, :allow_blank => true
  validates_presence_of :name
  
  include Forem::DefaultPermissions
  
  def to_s
    name
  end
end
