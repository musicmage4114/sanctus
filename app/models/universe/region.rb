class Region < ApplicationRecord
  self.primary_key = 'region_id'
  
  belongs_to :faction,   inverse_of: :regions, optional: true
  
  has_one :region_scene, inverse_of: :region
  
  has_many :constellations,          inverse_of: :region
  has_many :denormalized_map_items,  inverse_of: :region
  has_many :wormhole_system_classes, as: :class_wormhole
end
