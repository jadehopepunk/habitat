class CommunitiesController < InheritedResources::Base
  load_and_authorize_resource
  actions :all
  autocomplete :community, :name

end