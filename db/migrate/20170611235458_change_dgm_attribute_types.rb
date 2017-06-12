class ChangeDgmAttributeTypes < ActiveRecord::Migration[5.1]
  class DogmaAttribute < ActiveRecord::Base
  end
  
  def change
    rename_table :dgmAttributeTypes, :dogma_attributes
    change_table :dogma_attributes do |t|
      t.rename :attributeID, :attribute_id
      t.rename :iconID, :icon_id
      t.index :icon_id
      t.rename :defaultValue, :default_value
      t.rename :displayName, :display_name
      t.rename :unitID, :unit_id
      t.rename :categoryID, :category_id
    end
    add_foreign_key :dogma_attributes, :dogma_attribute_categories, column: :category_id,
                                                                    primary_key: :category_id
  end
  
  def data
    change_table :dogma_attributes do |t|
      t.integer :data_export, null: false, default: 1, index: true
      t.integer :stacking,    null: false, default: 1, index: true
      t.integer :good,        null: false, default: 1, index: true
    end

    DogmaAttribute.reset_column_information
    DogmaAttribute.where(published: false).update_all(data_export: 0)
    DogmaAttribute.where(stackable: false).update_all(stacking: 0)
    DogmaAttribute.where(highIsGood: false).update_all(good: 0)
    
    change_table :dogma_attributes do |t|
      t.remove :published
      t.remove :stackable
      t.remove :highIsGood
    end
  end
  
  def rollback
    change_table :dogma_attributes do |t|
      t.boolean :published,  default: true
      t.boolean :stackable,  default: true
      t.boolean :highIsGood, default: true
    end
    
    DogmaAttribute.reset_column_information
    DogmaAttribute.where(data_export: 0).update_all(published: false)
    DogmaAttribute.where(stacking: 0).update_all(stackable: false)
    DogmaAttribute.where(good: 0).update_all(highIsGood: false)
    
    change_table :dogma_attributes do |t|
      t.remove :data_export
      t.remove :stacking
      t.remove :good
    end
  end
end
