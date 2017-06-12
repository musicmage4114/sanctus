class ChangeInvMarketGroups < ActiveRecord::Migration[5.1]
  class MarketGroup < ActiveRecord::Base
  end
  
  def change
    rename_table :invMarketGroups, :market_groups
    change_table :market_groups do |t|
      t.rename :marketGroupID, :market_group_id
      t.rename :parentGroupID, :parent_group_id
      t.index :parent_group_id
      t.rename :marketGroupName, :name
      t.rename :iconID, :icon_id
      t.index :icon_id
    end
    add_foreign_key :market_groups, :market_groups, column: :parent_group_id,
                                                    primary_key: :market_group_id
    add_foreign_key :market_groups, :icons,         primary_key: :icon_id
  end
  
  def data
    add_column :market_groups, :contents, :integer, null: false, default: 1, index: true
    
    MarketGroup.reset_column_information
    MarketGroup.where(hasTypes: false).update_all(contents: 0)
    
    remove_column :market_groups, :hasTypes
  end
  
  def rollback
    add_column :invMarketGroups, :hasTypes, :boolean, default: true
    
    MarketGroup.reset_column_information
    MarketGroup.where(contents: 0).update_all(hasTypes: false)
    
    remove_column :invMarketGroups, :contents
  end
end
