class KillmailAttacker < ApplicationRecord
  belongs_to :attacker,    polymorphic: true
  belongs_to :corporation, foreign_key: :attacker_corporation_id,
                           primary_key: :corporation_id,
                           inverse_of:  :killmail_attackers,
                           optional:    true
  belongs_to :alliance,    foreign_key: :attacker_alliance_id,
                           primary_key: :alliance_id,
                           inverse_of:  :killmail_attackers,
                           optional:    true
  belongs_to :faction,     foreign_key: :attacker_faction_id,
                           primary_key: :faction_id,
                           inverse_of:  :killmail_attackers,
                           optional:    true
  belongs_to :ship,        class_name:  'Item',
                           foreign_key: :ship_type_id,
                           primary_key: :type_id,
                           inverse_of:  :killmail_attackers,
                           optional:    true
  belongs_to :weapon,      class_name:  'Item',
                           foreign_key: :weapon_type_id,
                           primary_key: :type_id,
                           inverse_of:  :killmail_attackers,
                           optional:    true
end
