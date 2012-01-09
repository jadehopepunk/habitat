require 'spec_helper'

describe Project do
  def required_attributes(user = nil)
    {
      :user => user || User.make!,
      :name => 'Some Project',
      :address => 'New York, New York',
      :project_category_name => "Suburban Yard"
    }
  end
  
  describe "when creating" do
    it "should create a brief" do
      project = Project.create!(required_attributes)
      project.reload
      project.brief.should_not be_nil
    end
  end
end