class SolarSystem < ApplicationRecord
  self.primary_key = 'system_id'
  
  belongs_to :constellation,       inverse_of: :solar_systems
  belongs_to :faction,             inverse_of: :solar_systems, optional: true
  belongs_to :corporation,         inverse_of: :solar_systems, optional: true
  belongs_to :alliance,            inverse_of: :solar_systems, optional: true
  
  has_many :planets,               inverse_of: :solar_system
  has_many :stargates,             inverse_of: :solar_system
  has_many :bookmarks,             inverse_of: :solar_system
  has_many :fleet_memberships,     inverse_of: :solar_system
  has_many :killmails,             inverse_of: :solar_system
  has_many :factions,              inverse_of: :solar_system
  has_many :sovereignty_campaigns, inverse_of: :solar_system
  has_many :characters,            as: :current_location
  
  has_one :current_incursion,      class_name: 'InfestedSystem',
                                   inverse_of: :solar_system
  
  # TODO: scope :sovereignty
end
