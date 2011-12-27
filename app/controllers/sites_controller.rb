class SitesController < ApplicationController
  inherit_resources

  def show
    show! do
      @json = @site.to_gmaps4rails
    end
  end
  
end