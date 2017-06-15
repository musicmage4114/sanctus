class Constellation < ApplicationRecord
  self.primary_key = 'constellation_id'
  
  belongs_to :region,  inverse_of: :constellations
  belongs_to :faction, inverse_of: :constellations
  
  has_many :solar_systems,           inverse_of: :constellation
  has_many :sovereignty_campaigns,   inverse_of: :constellation
  has_many :denormalized_map_items,  inverse_of: :constellation
  has_many :wormhole_system_classes, as: :class_wormhole
  
  has_and_belongs_to_many :adjacent_constellations,
                          class_name: 'Constellation',
                          join_table: :constellation_connections,
                          foreign_key: :from_constellation_id,
                          association_foreign_key: :to_constellation_id,
                          distinct: true,
                          finder_sql: proc { %(SELECT DISTINCT "constellations".* FROM "constellations"
                                              INNER JOIN "adjacent_constellations" ON "constellations"."constellation_id" = "adjacent_constellations"."to_constellation_id"
                                              WHERE "adjacent_constellations"."from_constellation_id" = #{self.constellation_id}
                                              UNION
                                              SELECT DISTINCT "constellations".* FROM "constellations"
                                              INNER JOIN "adjacent_constellations" ON "constellations"."constellation_id" = "adjacent_constellations"."from_constellation_id"
                                              WHERE "adjacent_constellations"."to_constellation_id" = #{self.constellation_id} ) }
  
  alias_attribute :systems, :solar_systems
  
  # TODO: scope :adjacent_regions
end
