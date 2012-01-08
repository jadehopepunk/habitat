class Goals::LabourInputsController < ApplicationController
  include Goals::Shared
  autocomplete :job, :name
end