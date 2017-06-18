class Faction < ApplicationRecord
  self.primary_key = 'faction_id'
  
  # API data: boolean - is_unique
  enum uniqueness: [:not_unique, :unique]
  enum member_race: { caldari: 1,
                      minmatar: 2,
                      amarr: 4,
                      gallente: 8,
                      gallente_caldari: 9,
                      all_empire: 15,
                      jove: 16,
                      pirate: 32,
                      sleepers: 64,
                      ore: 128 }

  belongs_to :home_system, class_name:  'SolarSystem',
                           foreign_key: :solar_system_id,
                           primary_key: :system_id,
                           inverse_of:  :factions,
                           optional:    true
  belongs_to :executor,    class_name:  'Corporation',
                           foreign_key: :corporation_id,
                           primary_key: :corporation_id,
                           inverse_of:  :factions,
                           optional:    true
  belongs_to :militia,     class_name:  'Corporation',
                           foreign_key: :militia_corporation_id,
                           primary_key: :corporation_id,
                           inverse_of:  :factions
  
  has_many :corporations,    inverse_of:  :faction
  has_many :losses,          class_name:  'Killmail',
                             foreign_key: :victim_faction_id,
                             inverse_of:  :faction
  has_many :attacks,         class_name:  'KillmailAttacker',
                             foreign_key: :attacker_faction_id,
                             inverse_of:  :faction
  has_many :kills,           through:     :attacks, source: :killmail
  has_many :solar_systems,   inverse_of:  :faction
  has_many :tower_resources, inverse_of:  :faction
  
  # TODO: scope :killmails - returns all killmails involving members
end
