require 'spec_helper'

describe Site do
  def required_attributes(user = nil)
    {}
  end

  describe "when creating" do
    it "should create a soil" do
      site = Site.create!(required_attributes)
      site.reload
      soil = site.default_soil
      soil.should_not be_nil
      soil.name.should == 'Site Soil'
    end
  end
end
