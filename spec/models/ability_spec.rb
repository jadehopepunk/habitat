require 'spec_helper'
require "cancan/matchers"

describe Ability do
  describe "guest viewer" do
    before :each do
      @ability = Ability.new(nil)
    end
    
    it "should be able to read public project" do
      @ability.should be_able_to(:read, Project.new(:is_public => true))
    end
    
    it "should be able to view a community" do
      @ability.should be_able_to(:read, Community.new)
    end
  end
  
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
      @project = Project.make!(:user => user, :is_public => false)
      @ability = Ability.new(user)
    end    
    
    it "should able to manage project" do
      @ability.should be_able_to(:manage, @project)  
    end
  end
  
  describe "project observer" do
    before :each do
      user = User.make!
      @project = Project.make!(:is_public => false)
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
  
  describe "community member" do
    before :each do
      @viewer = User.make!
      @community = Community.make!
      @project = Project.make!(:is_public => false, :user => User.make)
      @other_project = Project.make!(:is_public => false, :user => @viewer)
      ProjectCommunity.create!(:project => @other_project, :community => @community, :access => 'list')      
      @ability = Ability.new(@viewer)
    end
        
    describe "for readable project" do
      before :each do
        ProjectCommunity.create!(:project => @project, :community => @community, :access => 'read')
      end
      
      it "should be able to read project" do
        @ability.should be_able_to(:read, @project)  
      end

      it "should not be able to write to project" do
        @ability.should_not be_able_to(:edit, @project)  
      end      
    end

    describe "for readable project" do
      before :each do
        ProjectCommunity.create!(:project => @project, :community => @community, :access => 'edit')
      end
      
      it "should be able to edit project" do
        @ability.should be_able_to(:edit, @project)  
      end
    end
  end
end
