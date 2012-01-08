class Goals::YieldsController < ApplicationController
  include Goals::Shared
  autocomplete :use, :name
end