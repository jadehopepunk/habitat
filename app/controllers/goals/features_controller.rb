class Goals::FeaturesController < ApplicationController
  include Goals::Shared
  autocomplete :feature, :name
  
end