class SiteAnalysis::SoilTestsController < InheritedResources::Base
  layout 'site_analysis'
  belongs_to :project
  before_filter :increment_heading
  actions :all, :except => :show
end