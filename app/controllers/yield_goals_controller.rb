class YieldGoalsController < InheritedResources::Base
  load_and_authorize_resource
  belongs_to :site
end