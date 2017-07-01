class ChangeInvGroups < ActiveRecord::Migration[5.1]
  class ItemGroup < ActiveRecord::Base
  end
  
  def change
    rename_table :invGroups, :item_groups
    change_table :item_groups do |t|
      t.rename :groupID, :group_id
      t.rename :categoryID, :category_id
      t.rename :groupName, :name
      t.rename :iconID, :icon_id
      t.index :icon_id
      t.rename :useBasePrice, :base_price
      t.rename :fittableNonSingleton, :fit_multiple
    end
    add_foreign_key :item_groups, :item_categories,   column: :category_id,
                                                      primary_key: :category_id
    add_foreign_key :item_groups, :icons,             primary_key: :icon_id
    add_foreign_key :items, :item_groups,             column: :group_id,
                                                      primary_key: :group_id
    add_foreign_key :certificates, :item_groups,      column: :group_id,
                                                      primary_key: :group_id
    add_foreign_key :dogma_expressions, :item_groups, primary_key: :group_id
  end

  def data
    add_column :item_groups, :data_export, :integer, null: false, default: 1, index: true
  
    ItemGroup.reset_column_information
    ItemGroup.where(published: false).update_all(data_export: 0)
  
    remove_column :item_groups, :published
  end

  def rollback
    add_column :invGroups, :published, :boolean, null: false, default: true
  
    ItemGroup.reset_column_information
    ItemGroup.where(data_export: 0).update_all(published: false)
  
    remove_column :invGroups, :data_export
  end
end
