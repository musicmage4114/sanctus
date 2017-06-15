class Constellation < ApplicationRecord
  self.primary_key = 'constellation_id'
  
  belongs_to :region,  inverse_of: :constellations
  belongs_to :faction, inverse_of: :constellations
  
  has_many :solar_systems,             inverse_of:  :constellation
  has_many :sovereignty_campaigns,     inverse_of:  :constellation
  has_many :denormalized_map_items,    inverse_of:  :constellation
  has_many :constellation_connections, foreign_key: :from_constellation_id,
                                       inverse_of:  :constellation
  has_many :adjacent_constellations,   through:     :constellation_connections,
                                       source:      :to_constellation
  has_many :wormhole_system_classes, as: :class_wormhole
  
  alias_attribute :systems, :solar_systems
  
  # TODO: scope :adjacent_regions
end
