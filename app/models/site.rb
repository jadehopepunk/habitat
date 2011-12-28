class Site < ActiveRecord::Base
  CLIMATE_ZONES = %w(tropical sub-tropical temperate cool-temperate arid arctic)
  SIZE_UNITS = ['square metres', 'square feet', 'acres', 'hectares']
  
  acts_as_gmappable :lat => 'lat', :lng => 'lng', :check_process => :prevent_geocoding?,
                    :address => "address", :normalized_address => "address",
                    :msg => "Sorry, not even Google could figure out where that is"

  image_accessor :photo

  has_many :goals, :dependent => :destroy
  belongs_to :user

  validates_presence_of :user
  validates_presence_of :name
  validates_inclusion_of :climate_zone, :in => CLIMATE_ZONES, :allow_blank => true
  validates_inclusion_of :size_units, :in => SIZE_UNITS, :allow_blank => true
  validates_numericality_of :size, :allow_nil => true

  def size_with_unit
    unless size.blank?
      [size, size_units].compact.join(' ')
    end
  end

  def display_name
    name
  end
  
  protected

    def prevent_geocoding?
      address.blank? || (!lat.blank? && !lng.blank?) 
    end
end