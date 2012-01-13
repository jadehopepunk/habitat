require 'spec_helper'
require "cancan/matchers"

describe Ability do
  describe "admin" do
    before :each do
      user = User.make!(:admin)
      @ability = Ability.new(user)
    end
    
    it "should be able to manage everything" do
      @ability.should be_able_to(:manage, Project.new)  
    end
  end
  
  describe "project owner" do
    before :each do
      user = User.make!
      @project = Project.make!(:user => user)
      @ability = Ability.new(user)
    end    
    
    it "should able to manage project" do
      @ability.should be_able_to(:manage, @project)  
    end
  end
  
  describe "project observer" do
    before :each do
      user = User.make!
      @project = Project.make!
      @project.project_collaborators.create!(:user => user, :project_role => 'observer', :project => @project)
      @project.reload
      @ability = Ability.new(user)
    end
    
    it "should be able to read project" do
      @ability.should be_able_to(:read, @project)  
    end
    
    it "should not be able to write to project" do
      @ability.should_not be_able_to(:edit, @project)  
    end
  end
end
