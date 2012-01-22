class Site < ActiveRecord::Base
  belongs_to :project
  has_many :patches, :dependent => :destroy
  has_many :soils, :dependent => :destroy
  has_many :soil_tests, :dependent => :destroy
  has_many :attachments, :as => :target
  
  def name
    "#{project.name} Site" if project
  end
  
  def has_wrb98_codes?
    !soils.map(&:wrb98_code).reject(&:blank?).empty?
  end
end