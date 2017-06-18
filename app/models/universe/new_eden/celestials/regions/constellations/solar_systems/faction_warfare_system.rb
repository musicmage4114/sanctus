class FactionWarfareSystem < ApplicationRecord
  self.primary_key = 'system_id'
  
  enum combat_zone: { amarr: 3, caldari: 4, gallente: 5, minmatar: 6 }
  
  belongs_to :solar_system, foreign_key: :system_id,
                            primary_key: :system_id,
                            inverse_of:  :faction_warfare_systems
end
