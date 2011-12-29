class UsesController < InheritedResources::Base
  load_and_authorize_resource
  actions :all, :except => [:show]
end