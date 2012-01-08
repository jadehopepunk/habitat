require 'spec_helper'

describe Project do
  def required_attributes(user = nil)
    {
      :user => user || User.make!,
      :name => 'Some Project',
      :address => 'New York, New York',
      :project_category => ProjectCategory.first
    }
  end
  
  describe "when creating" do
    it "should create a brief" do
      project = Project.create!(required_attributes)
    end
  end
end