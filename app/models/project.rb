require 'unit'

class Project < ActiveRecord::Base
  CLIMATE_ZONES = %w(tropical sub-tropical temperate cool-temperate arid arctic)
  CURRENCIES = %w(USD AUD NZD EUR GBP)
  
  image_accessor :photo

  has_one :brief
  belongs_to :project_category
  has_many :attachments
  has_many :project_collaborators, :dependent => :destroy
  has_many :project_communities, :dependent => :destroy
  has_many :communities, :through => :project_communities, :uniq => true
  has_many :areas
  has_many :soil_tests
  
  accepts_nested_attributes_for :project_collaborators, :allow_destroy => true
  accepts_nested_attributes_for :project_communities, :allow_destroy => true
  
  geocoded_by :address
  after_validation :geocode

  validates_presence_of :name, :address, :project_category
  validates_inclusion_of :climate_zone, :in => CLIMATE_ZONES, :allow_blank => true
  validates_inclusion_of :site_area_unit, :in => Unit::LAND_AREA_UNITS, :allow_blank => true
  validates_inclusion_of :preferred_currency, :in => Money::Currency::TABLE.map {|row| row.last[:iso_code]}, :allow_blank => true
  validates_inclusion_of :preferred_measures, :in => Unit::SYSTEMS_OF_MEASURE, :allow_blank => true
  validates_numericality_of :site_area, :allow_nil => true
  validates_associated :project_collaborators
  validate :must_have_owner
  validate :must_have_unique_collaborators

  has_amount_with_unit :name => :site_area
  can_assign_by_name :project_category
  
  after_create :create_dependencies
  
  def user
    first_collaborator = project_collaborators.owners.first
    first_collaborator.user if first_collaborator
  end
  
  def user=(value)
    self.project_collaborators << ProjectCollaborator.new(:project_role => 'owner', :user => value, :project => self)
    value
  end

  def display_name
    name
  end
  
  def hemisphere
    if latitude && longitude
      latitude >= 0 ? 'northern' : 'southern'
    end
  end
  
  def currency
    Money::Currency.new(preferred_currency)
  rescue Money::Currency::UnknownCurrency
    Money.default_currency
  end
  
  def owner_names
    project_collaborators.owners.map(&:user_name).to_sentence
  end
  
  def brief_id
    brief.id
  end
  
  protected

    def prevent_geocoding?
      address.blank? || (!latitude.blank? && !longitude.blank?) || ['test', 'cucumber'].include?(Rails.env)
    end
    
    def create_dependencies
      create_brief!
    end
    
    def must_have_owner
      remaining_owners = project_collaborators.reject do |collaborator|
        collaborator.marked_for_destruction? || collaborator.project_role != 'owner'
      end
      if remaining_owners.empty?
        errors.add(:project_collaborators, "must include at least one owner")
      end
    end
    
    def must_have_unique_collaborators
      remaining_users = project_collaborators.reject(&:marked_for_destruction?).map(&:user)
      if remaining_users.uniq.length < remaining_users.length
        errors.add(:project_collaborators, "can only include each person once")
      end
    end
end