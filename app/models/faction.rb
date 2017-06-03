class Faction < ApplicationRecord
  self.primary_key = 'faction_id'
  # API data: boolean - is_unique
  enum uniqueness: [:not_unique, :unique]

  belongs_to :solar_system,     inverse_of:  :factions, optional: true
  belongs_to :head_corporation, class_name:  'Corporation',
                                foreign_key: :corporation_id,
                                inverse_of:  :factions,
                                optional:    true
  
  has_many :corporations, inverse_of: :faction
end
