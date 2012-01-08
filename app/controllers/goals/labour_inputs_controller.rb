class Goals::LabourInputsController < Goals::Base
  autocomplete :job, :name
end