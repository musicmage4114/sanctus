class ChangeChrFactions < ActiveRecord::Migration[5.1]
  def change
    rename_table :chrFactions, :factions
    change_table :factions do |t|
      t.rename :factionID, :faction_id
      t.rename :factionName, :name
      t.rename :raceIDs, :race_id
      t.index :race_id
      t.rename :solarSystemID, :solar_system_id
      t.index :solar_system_id
      t.rename :corporationID, :corporation_id
      t.rename :sizeFactor, :size_factor
      t.rename :stationCount, :station_count
      t.rename :stationSystemCount, :station_system_count
      t.rename :militiaCorporationID, :militia_corporation_id
      t.index :militia_corporation_id
      t.rename :iconID, :icon_id
      t.column :uniqueness, :integer, null: false, default: 1, index: true
    end
  end
end
