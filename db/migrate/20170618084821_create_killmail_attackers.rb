class CreateKillmailAttackers < ActiveRecord::Migration[5.1]
  def change
    create_table :killmail_attackers, id: false do |t|
      t.belongs_to :killmail,             null: false, index: true
      t.belongs_to :attacker,             polymorphic: true,
                                          null: false,
                                          index: { name: 'killmail_attackers-index' }
      t.belongs_to :attacker_corporation, index: true
      t.belongs_to :attacker_alliance,    index: true
      t.belongs_to :attacker_faction,     index: true
      t.belongs_to :ship_type,            index: true
      t.belongs_to :weapon_type,          index: true
      t.decimal    :security_status
      t.integer    :damage_dealt
    end
    add_foreign_key :killmail_attackers, :killmails,    primary_key: :killmail_id
    add_foreign_key :killmail_attackers, :characters,   column: :attacker_id,
                                                        primary_key: :character_id
    add_foreign_key :killmail_attackers, :corporations, column: :attacker_corporation_id,
                                                        primary_key: :corporation_id
    add_foreign_key :killmail_attackers, :alliances,    column: :attacker_alliance_id,
                                                        primary_key: :alliance_id
    add_foreign_key :killmail_attackers, :factions,     column: :attacker_faction_id,
                                                        primary_key: :faction_id
    add_foreign_key :killmail_attackers, :items,        column: :ship_type_id,
                                                        primary_key: :type_id
    add_foreign_key :killmail_attackers, :items,        column: :weapon_type_id,
                                                        primary_key: :type_id
  end
end
