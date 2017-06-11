class ChangeCrpNpcCorporations < ActiveRecord::Migration[5.1]
  class Corporation < ActiveRecord::Base
  end
  
  def change
    rename_table :crpNPCCorporations, :corporations
    change_table :corporations do |t|
      t.rename :corporationID, :corporation_id
      t.rename :solarSystemID, :solar_system_id
      t.index :solar_system_id
      t.rename :friendID, :friend_id
      t.index :friend_id
      t.rename :enemyID, :enemy_id
      t.index :enemy_id
      t.rename :factionID, :faction_id
      t.index :faction_id
      t.rename :stationCount, :station_count
      t.rename :stationSystemCount, :station_system_count
      t.rename :iconID, :icon_id
      t.belongs_to :ceo, :integer, index: true
      t.decimal :tax_rate, :decimal, precision: 4, scale: 3
      t.string :ticker, limit: 5
      t.string :name
      t.belongs_to :creator, index: true
      t.belongs_to :alliance_id, index: true
      t.datetime :creation_date
      t.integer :member_count
      t.string :url
      t.integer :deletion_status, null: false, default: 0, index: true
      t.string :icon_64
      t.string :icon_128
      t.string :icon_256
      t.integer :corporation_type, null: false, default: 2, index: true
      t.timestamps null: true
    end
    remove_column :corporations, :size, :string, limit: 1
    remove_column :corporations, :extent, :string, limit: 1
    remove_column :corporations, :investorID1, :integer
    remove_column :corporations, :investorShares1, :integer
    remove_column :corporations, :investorID2, :integer
    remove_column :corporations, :investorShares2, :integer
    remove_column :corporations, :investorID3, :integer
    remove_column :corporations, :investorShares3, :integer
    remove_column :corporations, :investorID4, :integer
    remove_column :corporations, :investorShares4, :integer
    remove_column :corporations, :publicShares, :integer
    remove_column :corporations, :initialPrice, :integer
    remove_column :corporations, :minSecurity, :float
    remove_column :corporations, :scattered, :boolean
    remove_column :corporations, :fringe, :integer
    remove_column :corporations, :corridor, :integer
    remove_column :corporations, :hub, :integer
    remove_column :corporations, :border, :integer
    remove_column :corporations, :sizeFactor, :float
    
    add_foreign_key :corporations, :corporations, column: :friend_id,
                                                  primary_key: :corporation_id
    add_foreign_key :corporations, :corporations, column: :enemy_id,
                                                  primary_key: :corporation_id
  end
  
  def data
    Corporation.reset_column_information
    Corporation.update_all(corporation_type: 1)
    Corporation.where(faction_id: 500021).update_all(faction_id: nil)
    add_foreign_key :corporations, :factions, primary_key: :faction_id
  end
  
  def rollback
    Corporation.reset_column_information
    Corporation.find(1000193).update(faction_id: 500021)
    remove_foreign_key :corporations, :factions, primary_key: :faction_id
  end
end
