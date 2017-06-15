class ChangeMapRegions < ActiveRecord::Migration[5.1]
  def change
    rename_table :mapRegions, :regions
    change_table :regions do |t|
      t.rename :regionID, :region_id
      t.rename :regionName, :name
      t.rename :xMin, :x_min
      t.rename :xMax, :x_max
      t.rename :yMin, :y_min
      t.rename :yMax, :y_max
      t.rename :zMin, :z_min
      t.rename :zMax, :z_max
      t.rename :factionID, :faction_id
      t.index :faction_id
    end
    add_foreign_key :regions, :factions,         primary_key: :faction_id
    add_foreign_key :constellations, :regions,   primary_key: :region_id
    add_foreign_key :denormalized_map, :regions, primary_key: :region_id
    add_foreign_key :region_scenes, :regions,    primary_key: :region_id
  end
end
