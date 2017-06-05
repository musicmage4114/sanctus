class SolarSystem < ApplicationRecord
  self.primary_key = 'system_id'
  
  belongs_to :constellation,   inverse_of: :solar_systems
  
  has_many :planets,           inverse_of: :solar_system
  has_many :stargates,         inverse_of: :solar_system
  has_many :bookmarks,         inverse_of: :solar_system
  has_many :fleet_memberships, inverse_of: :solar_system
  has_many :killmails,         inverse_of: :solar_system
  has_many :factions,          inverse_of: :solar_system
  has_many :characters,        as: :current_location
  
  has_one :current_incursion,  foreign_key: :system_id, inverse_of: :solar_system
end
