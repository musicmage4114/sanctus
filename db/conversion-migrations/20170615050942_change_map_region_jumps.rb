class ChangeMapRegionJumps < ActiveRecord::Migration[5.1]
  def change
    rename_table :mapRegionJumps, :region_connections
    change_table :region_connections do |t|
      t.rename :fromRegionID, :from_region_id
      t.index :from_region_id
      t.rename :toRegionID, :to_region_id
      t.index :to_region_id
      t.index [:to_region_id, :from_region_id]
    end
    add_foreign_key :region_connections, :regions, column: :from_region_id,
                                                   primary_key: :region_id
    add_foreign_key :region_connections, :regions, column: :to_region_id,
                                                   primary_key: :region_id
  end
end
