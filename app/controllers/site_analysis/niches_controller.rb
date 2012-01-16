class SiteAnalysis::NichesController < InheritedResources::Base
  layout 'site_analysis'
  belongs_to :project
end
