require 'unit'

class Project < ActiveRecord::Base
  CLIMATE_ZONES = %w(tropical sub-tropical temperate cool-temperate arid arctic)
  SITE_AREA_UNITS = ['square metres', 'square feet', 'acres', 'hectares']
  
  acts_as_gmappable :lat => 'lat', :lng => 'lng', :check_process => :prevent_geocoding?,
                    :address => "address", :normalized_address => "address",
                    :msg => "Sorry, not even Google could figure out where that is"

  image_accessor :photo

  has_many :yield_goals, :dependent => :destroy
  has_many :labour_input_goals, :dependent => :destroy
  has_many :budget_goals, :dependent => :destroy
  belongs_to :user
  
  CURRENCIES = %w(USD AUD NZD)

  validates_presence_of :user
  validates_presence_of :name
  validates_inclusion_of :climate_zone, :in => CLIMATE_ZONES, :allow_blank => true
  validates_inclusion_of :site_area_unit, :in => SITE_AREA_UNITS, :allow_blank => true
  validates_inclusion_of :preferred_currency, :in => Money::Currency::TABLE.map {|row| row.last[:iso_code]}, :allow_blank => true
  validates_inclusion_of :preferred_measures, :in => Unit::SYSTEMS_OF_MEASURE, :allow_blank => true
  validates_numericality_of :site_area, :allow_nil => true

  def site_area_with_unit
    unless site_area.blank?
      [site_area, site_area_unit].compact.join(' ')
    end
  end

  def display_name
    name
  end
  
  def hemisphere
    if lat && lng
      lat >= 0 ? 'northern' : 'southern'
    end
  end
  
  def currency
    Money::Currency.new(preferred_currency)
  rescue Money::Currency::UnknownCurrency
    Money.default_currency
  end
  
  protected

    def prevent_geocoding?
      address.blank? || (!lat.blank? && !lng.blank?) 
    end
end