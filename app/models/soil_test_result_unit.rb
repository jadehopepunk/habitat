class SoilTestResultUnit < ActiveRecord::Base
  has_many :soil_test_results
  default_scope { order(:name) }

  def self.suggested_names
    all.map(&:name)
  end
end
