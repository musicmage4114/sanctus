class ChangeInvItems < ActiveRecord::Migration[5.1]
  class UniverseItem < ActiveRecord::Base
  end
  
  def change
    rename_table :invItems, :universe_items
    change_table :universe_items do |t|
      t.rename :itemID, :item_id
      t.rename :typeID, :type_id
      t.index :type_id
      t.rename :ownerID, :owner_id
      t.index :owner_id
      t.rename :locationID, :location_id
      t.rename :flagID, :flag_id
      t.index :flag_id
      t.index [:item_id, :type_id]
    end
    add_foreign_key :universe_items, :inventory_flags, column: :flag_id,
                                                       primary_key: :flag_id
  end

  def data
    add_column :universe_items, :location_type, :string
  
    UniverseItem.reset_column_information
    UniverseItem.where("location_id > ? and location_id < ?", 30000000, 40000000).update_all(location_type: 'SolarSystem')
    UniverseItem.where("location_id > ? and location_id < ?", 60000000, 70000000).update_all(location_type: 'Station')
    
    add_index :universe_items, [:location_type, :location_id]
  end

  def rollback
    remove_index :invItems, [:location_type, :location_id]
    remove_column :invItems, :location_type
  end
end
