class ChangeInvTypes < ActiveRecord::Migration[5.1]
  class Item < ActiveRecord::Base
  end
  
  def change
    rename_table :invTypes, :items
    change_table :items do |t|
      t.rename :typeID, :type_id
      t.rename :groupID, :group_id
      t.rename :typeName, :name
      t.rename :portionSize, :portion_size
      t.rename :raceID, :race_id
      t.rename :basePrice, :base_price
      t.rename :marketGroupID, :market_group_id
      t.rename :iconID, :icon_id
      t.rename :soundID, :sound_id
      t.rename :graphicID, :graphic_id
      t.string :type
    end
    add_foreign_key :items, :races, primary_key: :race_id
    add_foreign_key :dogma_attribute_values, :items, column: :type_id,
                                                     primary_key: :type_id
    add_foreign_key :dogma_effect_defaults, :items,  column: :type_id,
                                                     primary_key: :type_id
    add_foreign_key :research_agent_skills, :items,  column: :skill_type_id,
                                                     primary_key: :type_id
    add_foreign_key :bloodlines, :items,             column: :ship_type_id,
                                                     primary_key: :type_id
    add_foreign_key :npc_corp_research, :items,      column: :skill_type_id,
                                                     primary_key: :type_id
  end
  
  def data
    add_column :items, :data_export, :integer, null: false, default: 1, index: true
    
    Item.reset_column_information
    Item.where(published: false).update_all(data_export: 0)
    
    remove_column :items, :published
  end
  
  def rollback
    add_column :invTypes, :published, :boolean, null: false, default: true
    
    Item.reset_column_information
    Item.where(data_export: 0).update_all(published: false)
    
    remove_column :invTypes, :data_export
  end
end
