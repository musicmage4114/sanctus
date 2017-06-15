class SolarSystem < ApplicationRecord
  self.primary_key = 'system_id'
  
  enum topography: { fringe: 1, corridor: 2, hub: 3 }
  enum links: { system_link: 1, constellation_link: 2, region_link: 3 }
  
  belongs_to :constellation,        inverse_of:  :solar_systems
  belongs_to :region,               inverse_of:  :solar_systems
  belongs_to :faction,              inverse_of:  :solar_systems, optional: true
  belongs_to :corporation,          inverse_of:  :solar_systems, optional: true
  belongs_to :alliance,             inverse_of:  :solar_systems, optional: true
  belongs_to :sun_type,             class_name:  'Item',
                                    foreign_key: :sun_type_id,
                                    inverse_of:  :solar_systems
  
  has_many :planets,                inverse_of:  :solar_system
  has_many :stargates,              inverse_of:  :solar_system
  has_many :bookmarks,              inverse_of:  :solar_system
  has_many :fleet_memberships,      inverse_of:  :solar_system
  has_many :killmails,              inverse_of:  :solar_system
  has_many :factions,               inverse_of:  :solar_system
  has_many :sovereignty_campaigns,  inverse_of:  :solar_system
  has_many :denormalized_map_items, inverse_of:  :solar_system
  has_many :landmarks,              inverse_of:  :solar_system
  has_many :system_connections,     foreign_key: :from_system_id,
                                    inverse_of:  :solar_system
  has_many :adjacent_systems,       through:     :system_connections,
                                    source:      :to_system
  has_many :characters,              as: :current_location
  has_many :wormhole_system_classes, as: :class_wormhole
  
  has_one :current_incursion,       class_name: 'InfestedSystem',
                                    inverse_of: :solar_system
  
  # TODO: scope :sovereignty
end
