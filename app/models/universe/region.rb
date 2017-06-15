class Region < ApplicationRecord
  self.primary_key = 'region_id'
  
  belongs_to :faction,   inverse_of: :regions, optional: true
  
  has_one :region_scene, inverse_of: :region
  
  has_many :constellations,          inverse_of:  :region
  has_many :denormalized_map_items,  inverse_of:  :region
  has_many :region_connections,      foreign_key: :from_region_id,
                                     inverse_of:  :region
  has_many :adjacent_regions,        through:     :region_connections,
                                     source:      :to_region
  has_many :wormhole_system_classes, as: :class_wormhole
end
