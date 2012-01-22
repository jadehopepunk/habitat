class Site < ActiveRecord::Base
  belongs_to :project
  has_many :patches, :dependent => :destroy
  has_many :soils, :dependent => :destroy
  has_many :attachments, :as => :target

  after_create :create_dependencies
  
  def name
    "#{project.name} Site" if project
  end
  
  def has_wrb98_codes?
    !soils.map(&:wrb98_code).reject(&:blank?).empty?
  end
  
  def default_soil
    soils.first
  end
  
  private
  
    def create_dependencies
      soils.create!(:name => Soil::DEFAULT_NAME)
    end
end