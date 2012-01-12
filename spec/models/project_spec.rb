require 'spec_helper'

describe Project do
  def required_attributes(user = nil)
    required_attributes_except_user.merge(
      :user => user || User.make!
    )
  end
  
  def required_attributes_except_user
    {
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
    
    it "should be valid with a project collaborator" do
      user = User.make!
      project = Project.new(required_attributes_except_user)
      project.project_collaborators_attributes = [
        {'user_id' => user.id, 'project_role' => 'owner'}
      ]
      project.should be_valid
    end
    
    it "should not be valid without a project collaborator" do
      user = User.make!
      project = Project.new(required_attributes_except_user)
      project.should_not be_valid
    end
  end
  
  describe "when editing existing" do
    it "should not save with no project collaborators" do
      project = Project.make!
      project.project_collaborators_attributes = [
        {'id' => project.project_collaborators.first.id, '_destroy' => '1'}
      ]
      project.should_not be_valid
    end

    it "should not save with no project collaborators which are owners" do
      project = Project.make!
      project.project_collaborators_attributes = [
        {'id' => project.project_collaborators.first.id, 'project_role' => 'participant'}
      ]
      project.should_not be_valid
    end
  end
end