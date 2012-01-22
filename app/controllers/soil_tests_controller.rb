class SoilTestsController < InheritedResources::Base
  include Mixins::SoilPart
  
  def index
    redirect_to site_soils_path(@site)
  end
end