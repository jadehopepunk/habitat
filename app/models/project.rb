require 'unit'

class Project < ActiveRecord::Base
  CLIMATE_ZONES = %w(tropical sub-tropical temperate cool-temperate arid arctic)
  
  image_accessor :photo

  has_one :brief
  belongs_to :user
  belongs_to :project_category
  has_many :attachments
  
  CURRENCIES = %w(USD AUD NZD)
  
  geocoded_by :address
  after_validation :geocode

  validates_presence_of :user
  validates_presence_of :name, :address, :project_category
  validates_inclusion_of :climate_zone, :in => CLIMATE_ZONES, :allow_blank => true
  validates_inclusion_of :site_area_unit, :in => Unit::LAND_AREA_UNITS, :allow_blank => true
  validates_inclusion_of :preferred_currency, :in => Money::Currency::TABLE.map {|row| row.last[:iso_code]}, :allow_blank => true
  validates_inclusion_of :preferred_measures, :in => Unit::SYSTEMS_OF_MEASURE, :allow_blank => true
  validates_numericality_of :site_area, :allow_nil => true
  validates_uniqueness_of :name, :scope => :user_id

  has_amount_with_unit :name => :site_area
  can_assign_by_name :project_category
  
  after_create :create_dependencies

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
  
  protected

    def prevent_geocoding?
      address.blank? || (!latitude.blank? && !longitude.blank?) || ['test', 'cucumber'].include?(Rails.env)
    end
    
    def create_dependencies
      create_brief!
    end
end