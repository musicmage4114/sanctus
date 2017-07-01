class ChangeMapSolarSystems < ActiveRecord::Migration[5.1]
  class SolarSystem < ActiveRecord::Base
  end
  
  def change
    rename_table :mapSolarSystems, :solar_systems
    change_table :solar_systems do |t|
      t.rename :solarSystemID, :system_id
      t.rename :regionID, :region_id
      t.rename :constellationID, :constellation_id
      t.rename :solarSystemName, :name
      t.rename :xMin, :x_min
      t.rename :xMax, :x_max
      t.rename :yMin, :y_min
      t.rename :yMax, :y_max
      t.rename :zMin, :z_min
      t.rename :zMax, :z_max
      t.rename :security, :security_status
      t.rename :factionID, :faction_id
      t.index :faction_id
      t.rename :sunTypeID, :sun_type_id
      t.index :sun_type_id
      t.rename :securityClass, :security_class
      t.index [:system_id, :constellation_id]
      t.index [:system_id, :region_id]
      t.index [:system_id, :faction_id]
      t.integer :jumps_last_hour
      t.datetime :last_jumps_check
      t.integer :npc_kills_last_hour
      t.integer :pod_kills_last_hour
      t.integer :ship_kills_last_hour
      t.datetime :last_kills_check
      t.belongs_to :corporation
      t.belongs_to :alliance
      t.index [:system_id, :corporation_id]
      t.index [:system_id, :alliance_id]
      
      t.timestamps null: true
    end
    add_foreign_key :solar_systems, :constellations,   primary_key: :constellation_id
    add_foreign_key :solar_systems, :regions,          primary_key: :region_id
    add_foreign_key :solar_systems, :factions,         primary_key: :faction_id
    add_foreign_key :solar_systems, :items,            column: :sun_type_id,
                                                       primary_key: :type_id
    add_foreign_key :corporations, :solar_systems,     primary_key: :system_id
    add_foreign_key :denormalized_map, :solar_systems, primary_key: :system_id
    add_foreign_key :factions, :solar_systems,         primary_key: :system_id
    add_foreign_key :landmarks, :solar_systems,        primary_key: :system_id
  end
  
  def data
    change_table :solar_systems do |t|
      t.integer :topography, null: false, default: 3, index: true
      t.integer :links,      null: false, default: 1, index: true
    end
    
    SolarSystem.reset_column_information
    SolarSystem.where(fringe: true).update_all(topography: 1)
    SolarSystem.where(corridor: true).update_all(topography: 2)
    SolarSystem.where(regional: true).update_all(links: 3)
    
    change_table :solar_systems do |t|
      t.remove :fringe
      t.remove :corridor
      t.remove :hub
      t.remove :regional
      t.remove :constellation
    end
  end
  
  def rollback
    change_table :mapSolarSystems do |t|
      t.boolean :fringe,   default: false
      t.boolean :corridor, default: false
      t.boolean :hub,      default: false
      t.boolean :regional, default: false
      t.boolean :constellation
    end
    
    SolarSystem.reset_column_information
    SolarSystem.where(topography: 3).update_all(hub: true)
    SolarSystem.where(topography: 2).update_all(corridor: true)
    SolarSystem.where(topography: 1).update_all(fringe: true)
    SolarSystem.where(links: 3).update_all(regional: true)
    
    change_table :mapSolarSystems do |t|
      t.remove :topography
      t.remove :links
    end
  end
end
