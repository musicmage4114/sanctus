class Region < ApplicationRecord
  self.primary_key = 'region_id'
  
  has_many :constellations,         inverse_of: :region
  has_many :denormalized_map_items, inverse_of: :region
end
