class AddForeignKeys < ActiveRecord::Migration[5.0]
  def change
    add_foreign_key :dogma_attribute_values, :dogma_attributes, column: :attribute_id, primary_key: :attribute_id
    add_foreign_key :dogma_attribute_values, :items,            column: :type_id,      primary_key: :type_id
    
    add_foreign_key :alliance_histories, :corporations, primary_key: :corporation_id
    add_foreign_key :alliance_histories, :alliances,    primary_key: :alliance_id
    
    add_foreign_key :personal_blueprints, :blueprints, column: :type_id, primary_key: :type_id
    add_foreign_key :personal_blueprints, :characters, primary_key: :character_id
    
    add_foreign_key :item_groups, :item_categories, column: :category_id, primary_key: :category_id
    
    add_foreign_key :characters, :corporations, primary_key: :corporation_id
    add_foreign_key :characters, :alliances,    primary_key: :alliance_id
    
    add_foreign_key :corporations, :characters, column: :ceo_id, primary_key: :character_id
    add_foreign_key :corporations, :alliances,  primary_key: :alliance_id
    
    add_foreign_key :alliances, :corporations, column: :executor_corporation_id, primary_key: :corporation_id
    
    add_foreign_key :items, :item_groups, column: :group_id, primary_key: :group_id
  end
end
