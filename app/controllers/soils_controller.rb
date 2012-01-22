class SoilsController < InheritedResources::Base
  include Mixins::SitePart
  actions :all, :except => :show

end