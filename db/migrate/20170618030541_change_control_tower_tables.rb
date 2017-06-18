class ChangeControlTowerTables < ActiveRecord::Migration[5.1]
  def change
    rename_table :invControlTowerResources, :tower_resources
    change_table :tower_resources do |t|
      t.rename :controlTowerTypeID, :tower_type_id
      t.rename :resourceTypeID, :resource_type_id
      t.rename :minSecurityLevel, :min_security_level
      t.rename :factionID, :faction_id
      t.index :faction_id
      t.index :tower_type_id
      t.index :resource_type_id
    end
    add_foreign_key :tower_resources, :items,    column: :tower_type_id,
                                                 primary_key: :type_id
    add_foreign_key :tower_resources, :items,    column: :resource_type_id,
                                                 primary_key: :type_id
    add_foreign_key :tower_resources, :factions, primary_key: :faction_id
    
    drop_table :invControlTowerResourcePurposes do |t|
      t.integer :purpose, null: false, index: { unique: true }
      t.string :purposeText, limit: 100
    end
  end
end
