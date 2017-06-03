class KillmailAttacker < ApplicationRecord
  belongs_to :attacker,    class_name: 'Character',
                           foreign_key: :attacker_id,
                           inverse_of: :killmail_attackers
  belongs_to :corporation, foreign_key: :attacker_corporation_id,
                           inverse_of: :killmail_attackers,
                           optional: true
  belongs_to :alliance,    foreign_key: :attacker_alliance_id,
                           inverse_of: :killmail_attackers,
                           optional: true
  belongs_to :faction,     foreign_key: :attacker_faction_id,
                           inverse_of: :killmail_attackers,
                           optional: true
  belongs_to :ship,        foreign_key: :ship_type_id,
                           inverse_of: :killmail_attackers,
                           optional: true
  belongs_to :weapon,      foreign_key: :weapon_type_id,
                           inverse_of: :killmail_attackers,
                           optional: true
end
