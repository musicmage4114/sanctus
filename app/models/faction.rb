class Faction < ApplicationRecord
  self.primary_key = 'faction_id'
  
  # API data: boolean - is_unique
  enum uniqueness: [:not_unique, :unique]

  belongs_to :home_system,      class_name:  'SolarSystem',
                                foreign_key: :solar_system_id,
                                inverse_of:  :factions,
                                optional: true
  belongs_to :head_corporation, class_name:  'Corporation',
                                foreign_key: :corporation_id,
                                inverse_of:  :factions,
                                optional:    true
  belongs_to :militia,          class_name:  'Corporation',
                                foreign_key: :militia_corporation_id,
                                inverse_of:  :faction
  
  has_many :corporations,       inverse_of:  :faction
  has_many :losses,             class_name:  'Killmail',
                                foreign_key: :victim_faction_id,
                                inverse_of:  :faction
  has_many :killmail_attacks,   class_name:  'KillmailAttacker',
                                foreign_key: :attacker_faction_id,
                                inverse_of:  :faction
  has_many :kills,              through:     :killmail_attackers,
                                source:      :killmail
  has_many :solar_systems,      inverse_of:  :faction
  
  # TODO: scope :killmails - returns all killmails involving members
end
