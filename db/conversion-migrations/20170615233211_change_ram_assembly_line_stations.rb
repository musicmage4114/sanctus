class ChangeRamAssemblyLineStations < ActiveRecord::Migration[5.1]
  def change
    rename_table :ramAssemblyLineStations, :industry_facilities
    change_table :industry_facilities do |t|
      t.rename :stationID, :facility_id
      t.rename :assemblyLineTypeID, :assembly_line_id
      t.rename :stationTypeID, :station_type_id
      t.rename :ownerID, :owner_id
      t.rename :solarSystemID, :solar_system_id
      t.rename :regionID, :region_id
      t.float :tax
    end
    add_foreign_key :industry_facilities, :items,         column: :station_type_id,
                                                          primary_key: :type_id
    add_foreign_key :industry_facilities, :corporations,  column: :owner_id,
                                                          primary_key: :corporation_id
    add_foreign_key :industry_facilities, :solar_systems, primary_key: :system_id
    add_foreign_key :industry_facilities, :regions,       primary_key: :region_id
  end
end
