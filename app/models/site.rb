class Site < ActiveRecord::Base
  belongs_to :project
  has_many :areas, :dependent => :destroy
  has_many :soil_tests, :dependent => :destroy
end