class AddAndRemoveIndicesOnTables < ActiveRecord::Migration[5.1]
  def change
    add_index :assembly_categories, :assembly_line_id
    add_index :assembly_categories, :category_id
    add_index :assembly_groups, :assembly_line_id
    add_index :assembly_groups, :group_id
    add_index :assembly_lines, :activity_type
    add_index :agents, :division
    add_index :agents, :location_id
    add_index :agents, :agent_type
    add_index :ancestries, :bloodline_id
    add_index :certificate_skills, :level_name
    add_index :dogma_attributes, :unit_id
    add_index :dogma_attributes, :data_export
    add_index :dogma_attributes, :stacking
    add_index :dogma_attributes, :good
    add_index :dogma_effects, :guid
    add_index :dogma_effects, :npc_usage_chance_attribute_id, name: 'npc_usage_change_index'
    add_index :dogma_effects, :npc_activation_chance_attribute_id, name: 'npc_activation_chance_index'
    add_index :dogma_effects, :fitting_usage_chance_attribute_id, name: 'fitting_usage_chance_index'
    add_index :dogma_effects, :auto_repeat
    add_index :dogma_effects, :data_export
    add_index :dogma_effects, :warp_safety
    add_index :factions, :uniqueness
    add_index :industry_activities, :data_export
    add_index :industry_facilities, :facility_id
    add_index :industry_facilities, :assembly_line_id
    add_index :industry_facilities, :station_type_id
    add_index :item_categories, :data_export
    add_index :item_groups, :data_export
    add_index :items, :race_id
    add_index :items, :market_group_id
    add_index :items, :graphic_id
    add_index :items, :data_export
    add_index :landmarks, :solar_system_id
    add_index :landmarks, :icon_id
    add_index :npc_corp_divisions, :corporation_id
    add_index :pin_schematics, :schematic_id
    add_index :pin_schematics, :pin_type_id
    add_index :schematic_materials, :schematic_id
    add_index :schematic_materials, :material_id
    add_index :wormhole_system_classes, :class_id
    
    remove_index :solar_systems, [:system_id, :alliance_id]
    remove_index :solar_systems, [:system_id, :constellation_id]
    remove_index :solar_systems, [:system_id, :corporation_id]
    remove_index :solar_systems, [:system_id, :faction_id]
    remove_index :solar_systems, [:system_id, :region_id]
    remove_index :stargates, [:stargate_id, :destination_stargate_id]
    remove_index :stargates, [:stargate_id, :destination_system_id]
    remove_index :universe_items, [:item_id, :type_id]
    remove_index :universe_unique_names, [:item_id, :name]
    remove_index :bonus_traits, [:trait_id, :skill_id]
    remove_index :bonus_traits, [:type_id, :trait_id]
    remove_index :certificate_masteries, [:type_id, :cert_id]
    remove_index :certificate_skills, [:cert_id, :skill_id]
    remove_index :contraband, [:faction_id, :type_id]
    remove_index :industry_installations, name: 'installation_assembly_line_type_index'
    remove_index :industry_probabilities, name: 'blueprint_product_type_id_index'
    remove_index :industry_reactions, name: 'reaction_reagent_type_id_index'
    remove_index :meta_variations, name: 'meta_base_type_id_index'
    remove_index :meta_variations, name: 'meta_group_type_id_index'
    remove_index :region_scenes, [:region_id, :graphic_id]
  end
end
