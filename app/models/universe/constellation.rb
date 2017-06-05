class Constellation < ApplicationRecord
  self.primary_key = 'constellation_id'
  
  belongs_to :region, inverse_of: :constellations
  
  has_many :solar_systems, inverse_of: :constellation
  
  alias_attribute :systems, :solar_systems
end
