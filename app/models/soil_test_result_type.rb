class SoilTestResultType < ActiveRecord::Base
  default_scope { order(:name) }
  
  def self.suggested_names
    all.map(&:name)
  end
end
