class ChangeCombatZoneTables < ActiveRecord::Migration[5.1]
  def change
    rename_table :warCombatZoneSystems, :faction_warfare_systems
    change_table :faction_warfare_systems do |t|
      t.rename :solarSystemID, :system_id
      t.rename :combatZoneID, :combat_zone
    end
    add_foreign_key :faction_warfare_systems, :solar_systems, column: :system_id,
                                                              primary_key: :system_id
    
    drop_table :warCombatZones do |t|
      t.integer :combatZoneID, null: false, index: { unique: true }
      t.string :combatZoneName, limit: 100
      t.integer :factionID
      t.integer :centerSystemID
      t.string :description, limit: 500
    end
  end
end
