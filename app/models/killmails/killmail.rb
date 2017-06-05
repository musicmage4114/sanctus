class Killmail < ApplicationRecord
  self.primary_key = 'killmail_id'
  
  belongs_to :victim,         class_name:  'Character',
                              foreign_key: :victim_id,
                              inverse_of:  :killmails
  belongs_to :corporation,    foreign_key: :victim_corporation_id,
                              inverse_of:  :killmails,
                              optional:    true
  belongs_to :alliance,       foreign_key: :victim_alliance_id,
                              inverse_of:  :killmails,
                              optional:    true
  belongs_to :faction,        foreign_key: :victim_faction_id,
                              inverse_of:  :killmails,
                              optional:    true
  belongs_to :solar_system,   inverse_of:  :killmails
  belongs_to :moon,           inverse_of:  :killmails, optional: true
  belongs_to :war,            inverse_of:  :killmails, optional: true
  belongs_to :final_blow,     polymorphic: true

  has_many :killmail_items,   inverse_of:  :killmail
  has_many :attackers,        class_name:  'KillmailAttacker',
                              inverse_of:  :killmail
  
  # TODO: scope :containers - killmail_items that contain other items
  # TODO: scope :container_contents - killmail_items contained in other items
  
  alias_attribute :involved_parties, :killmail_parties
end
