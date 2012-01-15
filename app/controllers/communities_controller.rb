class CommunitiesController < InheritedResources::Base
  load_and_authorize_resource
  actions :all
  autocomplete :community, :name

  def show
    @uses = @community.common_models_for_project(Use).limit(10)
    @features = @community.common_models_for_project(Feature).limit(10)
  end

end