class Site < ActiveRecord::Base
  CLIMATE_ZONES = %w(tropical sub-tropical temperate cool-temperate arid arctic)
  
  acts_as_gmappable :lat => 'lat', :lng => 'lng', :check_process => :prevent_geocoding?,
                    :address => "address", :normalized_address => "address",
                    :msg => "Sorry, not even Google could figure out where that is"

  validates_presence_of :name
  validates_inclusion_of :climate_zone, :in => CLIMATE_ZONES, :allow_nil => true

  protected

    def prevent_geocoding?
      address.blank? || (!lat.blank? && !lng.blank?) 
    end
end