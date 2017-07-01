class ChangeMapContellationJumps < ActiveRecord::Migration[5.1]
  def change
    rename_table :mapConstellationJumps, :constellation_connections
    change_table :constellation_connections do |t|
      t.rename :fromRegionID, :from_region_id
      t.index :from_region_id
      t.rename :fromConstellationID, :from_constellation_id
      t.index :from_constellation_id
      t.rename :toConstellationID, :to_constellation_id
      t.index :to_constellation_id
      t.rename :toRegionID, :to_region_id
      t.index :to_region_id
      t.index [:from_region_id, :to_constellation_id], name: 'from_region_to_constellation_index'
      t.index [:from_constellation_id, :to_region_id], name: 'from_constellation_to_region_index'
    end
  end
end
