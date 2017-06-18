class ChangeStaStations < ActiveRecord::Migration[5.1]
  def change
    rename_table :staStations, :dockable_structures
    change_table :dockable_structures do |t|
      t.rename :stationID, :dockable_id
      t.rename :maxShipVolumeDockable, :max_ship_volume
      t.rename :officeRentalCost, :office_rental_cost
      t.rename :operationID, :operation_id
      t.rename :stationTypeID, :station_type_id
      t.rename :corporationID, :owner_id
      t.rename :solarSystemID, :solar_system_id
      t.rename :constellationID, :constellation_id
      t.rename :regionID, :region_id
      t.rename :stationName, :name
      t.rename :reprocessingEfficiency, :reprocessing_efficiency
      t.rename :reprocessingStationsTake, :reprocessing_take
      t.rename :reprocessingHangarFlag, :reprocessing_hangar_flag
    end
    remove_column :dockable_structures, :dockingCostPerVolume, :float
    add_foreign_key :dockable_structures, :constellations, primary_key: :constellation_id
    add_foreign_key :dockable_structures, :corporations, column: :owner_id,
                                                         primary_key: :corporation_id
    add_foreign_key :dockable_structures, :items, column: :station_type_id,
                                                  primary_key: :type_id
    add_foreign_key :dockable_structures, :regions, primary_key: :region_id
    add_foreign_key :dockable_structures, :solar_systems, primary_key: :system_id
  end
end
