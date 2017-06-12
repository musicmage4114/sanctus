class ChangeInvMetaGroups < ActiveRecord::Migration[5.1]
  def change
    rename_table :invMetaGroups, :meta_item_groups
    change_table :meta_item_groups do |t|
      t.rename :metaGroupID, :meta_group_id
      t.rename :metaGroupName, :name
      t.rename :iconID, :icon_id
      t.index :icon_id
    end
    add_foreign_key :meta_item_groups, :icons, primary_key: :icon_id
  end
end
