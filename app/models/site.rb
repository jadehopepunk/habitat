class Site < ActiveRecord::Base
  belongs_to :project
  has_many :areas, :dependent => :destroy
end