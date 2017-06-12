class ChangeInvCategories < ActiveRecord::Migration[5.1]
  class ItemCategory < ActiveRecord::Base
  end
  
  def change
    rename_table :invCategories, :item_categories
    change_table :item_categories do |t|
      t.rename :categoryID, :category_id
      t.rename :categoryName, :name
      t.rename :iconID, :icon_id
      t.index :icon_id
    end
    add_foreign_key :item_categories, :icons, primary_key: :icon_id
  end

  def data
    add_column :item_categories, :data_export, :integer, null: false, default: 1, index: true
  
    ItemCategory.reset_column_information
    ItemCategory.where(published: false).update_all(data_export: 0)
  
    remove_column :item_categories, :published
  end

  def rollback
    add_column :item_categories, :published, :boolean, null: false, default: true
  
    ItemCategory.reset_column_information
    ItemCategory.where(data_export: 0).update_all(published: false)
  
    remove_column :item_categories, :data_export
  end
end
