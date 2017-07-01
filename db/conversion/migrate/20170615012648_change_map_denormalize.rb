class ChangeMapDenormalize < ActiveRecord::Migration[5.1]
  def change
    rename_table :mapDenormalize, :denormalized_map
    change_table :denormalized_map do |t|
      t.rename :itemID, :item_id
      t.rename :typeID, :type_id
      t.rename :groupID, :group_id
      t.index :group_id
      t.rename :solarSystemID, :solar_system_id
      t.rename :constellationID, :constellation_id
      t.rename :regionID, :region_id
      t.rename :orbitID, :orbit_id
      t.rename :itemName, :name
      t.rename :celestialIndex, :celestial_index
      t.rename :orbitIndex, :orbit_index
    end
    add_foreign_key :denormalized_map, :universe_items,   column: :item_id,
                                                          primary_key: :item_id
    add_foreign_key :denormalized_map, :items,            column: :type_id,
                                                          primary_key: :type_id
    add_foreign_key :denormalized_map, :item_groups,      column: :group_id,
                                                          primary_key: :group_id
    add_foreign_key :denormalized_map, :constellations,   primary_key: :constellation_id
    add_foreign_key :denormalized_map, :universe_items,   column: :orbit_id,
                                                          primary_key: :item_id
  end
end
