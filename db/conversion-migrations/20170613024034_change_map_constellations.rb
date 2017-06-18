class ChangeMapConstellations < ActiveRecord::Migration[5.1]
  def change
    rename_table :mapConstellations, :constellations
    change_table :constellations do |t|
      t.rename :constellationID, :constellation_id
      t.rename :regionID, :region_id
      t.index :region_id
      t.rename :constellationName, :name
      t.rename :xMin, :x_min
      t.rename :xMax, :x_max
      t.rename :yMin, :y_min
      t.rename :yMax, :y_max
      t.rename :zMin, :z_min
      t.rename :zMax, :z_max
      t.rename :factionID, :faction_id
      t.index :faction_id
    end
    add_foreign_key :constellations, :factions, primary_key: :faction_id
    add_foreign_key :constellation_connections, :constellations, column: :to_constellation_id,
                                                                 primary_key: :constellation_id
    add_foreign_key :constellation_connections, :constellations, column: :from_constellation_id,
                                                                 primary_key: :constellation_id
  end
end
