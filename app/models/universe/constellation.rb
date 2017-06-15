class Constellation < ApplicationRecord
  self.primary_key = 'constellation_id'
  
  belongs_to :region,  inverse_of: :constellations
  belongs_to :faction, inverse_of: :constellations
  
  has_many :solar_systems,           inverse_of: :constellation
  has_many :sovereignty_campaigns,   inverse_of: :constellation
  has_many :denormalized_map_items,  inverse_of:  :constellation
  has_many :wormhole_system_classes, as: :class_wormhole
  
  alias_attribute :systems, :solar_systems
  
  # join table/model - constellation_connections
  has_many :constellation_connections_in,  class_name:  'ConstellationConnection',
                                           foreign_key: :to_constellation_id,
                                           inverse_of:  :constellation
  has_many :constellation_connections_out, class_name:  'ConstellationConnection',
                                           foreign_key: :from_constellation_id,
                                           inverse_of:  :constellation
  has_many :to_constellations,   through: :constellation_connections_out,
                                 source:  :to_constellation
  has_many :from_constellations, through: :constellation_connections_in,
                                 source:  :from_constellation
  
  alias_attribute :adjacent_constellations, :to_constellations
  
  # TODO: scope :adjacent_regions
end
