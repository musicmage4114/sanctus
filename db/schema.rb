# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170617012855) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "agents", primary_key: "agent_id", id: :integer, default: nil, force: :cascade do |t|
    t.integer "division"
    t.integer "corporation_id"
    t.integer "location_id"
    t.integer "level"
    t.integer "agent_type"
    t.string "location_type"
    t.integer "locator_agent", default: 0
    t.index ["corporation_id"], name: "ix_agtAgents_corporationID"
    t.index ["location_type", "location_id"], name: "index_agents_on_location_type_and_location_id"
  end

  create_table "ancestries", primary_key: "ancestry_id", id: :integer, default: nil, force: :cascade do |t|
    t.string "name", limit: 100
    t.integer "bloodline_id"
    t.string "description", limit: 1000
    t.integer "perception"
    t.integer "willpower"
    t.integer "charisma"
    t.integer "memory"
    t.integer "intelligence"
    t.integer "icon_id"
    t.string "short_description", limit: 500
    t.index ["icon_id"], name: "index_ancestries_on_icon_id"
  end

  create_table "assembly_categories", primary_key: ["assembly_line_id", "category_id"], force: :cascade do |t|
    t.integer "assembly_line_id", null: false
    t.integer "category_id", null: false
    t.float "time_multiplier"
    t.float "material_multiplier"
    t.float "cost_multiplier"
  end

  create_table "assembly_groups", primary_key: ["assembly_line_id", "group_id"], force: :cascade do |t|
    t.integer "assembly_line_id", null: false
    t.integer "group_id", null: false
    t.float "time_multiplier"
    t.float "material_multiplier"
    t.float "cost_multiplier"
  end

  create_table "assembly_lines", primary_key: "assembly_line_id", id: :integer, default: nil, force: :cascade do |t|
    t.string "name", limit: 100
    t.string "description", limit: 1000
    t.float "base_time_multiplier"
    t.float "base_material_multiplier"
    t.float "base_cost_multiplier"
    t.float "volume"
    t.integer "activity_type"
    t.float "min_cost_per_hour"
  end

  create_table "bloodlines", primary_key: "bloodline_id", id: :integer, default: nil, force: :cascade do |t|
    t.string "name", limit: 100
    t.integer "race_id"
    t.string "description", limit: 1000
    t.string "male_description", limit: 1000
    t.string "female_description", limit: 1000
    t.integer "ship_type_id"
    t.integer "corporation_id"
    t.integer "perception"
    t.integer "willpower"
    t.integer "charisma"
    t.integer "memory"
    t.integer "intelligence"
    t.integer "icon_id"
    t.string "short_description", limit: 500
    t.string "short_male_description", limit: 500
    t.string "short_female_description", limit: 500
    t.index ["corporation_id"], name: "index_bloodlines_on_corporation_id"
    t.index ["icon_id"], name: "index_bloodlines_on_icon_id"
    t.index ["race_id"], name: "index_bloodlines_on_race_id"
    t.index ["ship_type_id"], name: "index_bloodlines_on_ship_type_id"
  end

  create_table "blueprint_materials", id: false, force: :cascade do |t|
    t.integer "blueprint_id"
    t.integer "activity_type"
    t.integer "material_type_id"
    t.integer "quantity"
    t.index ["activity_type"], name: "index_blueprint_materials_on_activity_type"
    t.index ["blueprint_id", "activity_type"], name: "industryActivityMaterials_idx1"
    t.index ["blueprint_id", "material_type_id"], name: "index_blueprint_materials_on_blueprint_id_and_material_type_id"
    t.index ["blueprint_id"], name: "ix_industryActivityMaterials_typeID"
    t.index ["material_type_id"], name: "index_blueprint_materials_on_material_type_id"
  end

  create_table "blueprint_production_limits", primary_key: "blueprint_id", id: :integer, default: nil, force: :cascade do |t|
    t.integer "max_production"
  end

  create_table "blueprint_products", id: false, force: :cascade do |t|
    t.integer "blueprint_id"
    t.integer "activity_type"
    t.integer "product_type_id"
    t.integer "quantity"
    t.index ["activity_type"], name: "index_blueprint_products_on_activity_type"
    t.index ["blueprint_id", "product_type_id"], name: "blueprint_product_type_id_product_index"
    t.index ["blueprint_id"], name: "ix_industryActivityProducts_typeID"
    t.index ["product_type_id"], name: "ix_industryActivityProducts_productTypeID"
  end

  create_table "blueprint_skills", id: false, force: :cascade do |t|
    t.integer "blueprint_id"
    t.integer "activity_type"
    t.integer "skill_id"
    t.integer "required_level"
    t.index ["activity_type"], name: "index_blueprint_skills_on_activity_type"
    t.index ["blueprint_id", "activity_type"], name: "industryActivitySkills_idx1"
    t.index ["blueprint_id", "skill_id"], name: "index_blueprint_skills_on_blueprint_id_and_skill_id"
    t.index ["blueprint_id"], name: "ix_industryActivitySkills_typeID"
    t.index ["skill_id"], name: "ix_industryActivitySkills_skillID"
  end

  create_table "bonus_traits", primary_key: "trait_id", id: :integer, default: -> { "nextval('\"bonus_traits_traitID_seq\"'::regclass)" }, force: :cascade do |t|
    t.integer "type_id"
    t.integer "skill_id"
    t.float "bonus"
    t.text "description"
    t.integer "unit_id"
    t.index ["skill_id"], name: "index_bonus_traits_on_skill_id"
    t.index ["trait_id", "skill_id"], name: "index_bonus_traits_on_trait_id_and_skill_id"
    t.index ["type_id", "trait_id"], name: "index_bonus_traits_on_type_id_and_trait_id"
    t.index ["type_id"], name: "index_bonus_traits_on_type_id"
    t.index ["unit_id"], name: "index_bonus_traits_on_unit_id"
  end

  create_table "celestials", primary_key: "celestial_id", id: :integer, default: nil, force: :cascade do |t|
    t.float "temperature"
    t.string "spectral_class", limit: 10
    t.float "luminosity"
    t.float "age"
    t.float "life"
    t.float "orbit_radius"
    t.float "eccentricity"
    t.float "mass_dust"
    t.float "mass_gas"
    t.boolean "fragmented"
    t.float "density"
    t.float "surface_gravity"
    t.float "escape_velocity"
    t.float "orbit_period"
    t.float "rotation_rate"
    t.boolean "locked"
    t.bigint "pressure"
    t.bigint "radius"
    t.integer "mass"
  end

  create_table "certificate_masteries", id: false, force: :cascade do |t|
    t.integer "type_id"
    t.integer "mastery_level"
    t.integer "cert_id"
    t.index ["cert_id"], name: "index_certificate_masteries_on_cert_id"
    t.index ["type_id", "cert_id"], name: "index_certificate_masteries_on_type_id_and_cert_id"
    t.index ["type_id"], name: "index_certificate_masteries_on_type_id"
  end

  create_table "certificate_skills", id: false, force: :cascade do |t|
    t.integer "cert_id"
    t.integer "skill_id"
    t.integer "certificate_level"
    t.integer "skill_level"
    t.integer "level_name"
    t.index ["cert_id", "skill_id"], name: "index_certificate_skills_on_cert_id_and_skill_id"
    t.index ["cert_id"], name: "index_certificate_skills_on_cert_id"
    t.index ["skill_id"], name: "ix_certSkills_skillID"
  end

  create_table "certificates", primary_key: "cert_id", id: :integer, default: nil, force: :cascade do |t|
    t.text "description"
    t.integer "group_id"
    t.string "name", limit: 255
    t.index ["group_id"], name: "index_certificates_on_group_id"
  end

  create_table "constellation_connections", primary_key: ["from_constellation_id", "to_constellation_id"], force: :cascade do |t|
    t.integer "from_constellation_id", null: false
    t.integer "to_constellation_id", null: false
    t.index ["from_constellation_id"], name: "index_constellation_connections_on_from_constellation_id"
    t.index ["to_constellation_id", "from_constellation_id"], name: "to_from_constellation_id_index"
    t.index ["to_constellation_id"], name: "index_constellation_connections_on_to_constellation_id"
  end

  create_table "constellations", primary_key: "constellation_id", id: :integer, default: nil, force: :cascade do |t|
    t.integer "region_id"
    t.string "name", limit: 100
    t.float "x"
    t.float "y"
    t.float "z"
    t.float "x_min"
    t.float "x_max"
    t.float "y_min"
    t.float "y_max"
    t.float "z_min"
    t.float "z_max"
    t.integer "faction_id"
    t.float "radius"
    t.index ["faction_id"], name: "index_constellations_on_faction_id"
    t.index ["region_id"], name: "index_constellations_on_region_id"
  end

  create_table "contraband", primary_key: ["faction_id", "type_id"], force: :cascade do |t|
    t.integer "faction_id", null: false
    t.integer "type_id", null: false
    t.float "standing_loss"
    t.float "confiscate"
    t.float "fine_by_value"
    t.float "attack"
    t.index ["faction_id", "type_id"], name: "index_contraband_on_faction_id_and_type_id"
    t.index ["faction_id"], name: "index_contraband_on_faction_id"
    t.index ["type_id"], name: "ix_invContrabandTypes_typeID"
  end

  create_table "corp_division_details", primary_key: "division_id", id: :integer, default: nil, force: :cascade do |t|
    t.string "name", limit: 100
    t.string "description", limit: 1000
    t.string "leader_title", limit: 100
  end

  create_table "corporations", primary_key: "corporation_id", id: :integer, default: nil, force: :cascade do |t|
    t.integer "solar_system_id"
    t.integer "friend_id"
    t.integer "enemy_id"
    t.integer "faction_id"
    t.integer "station_count"
    t.integer "station_system_count"
    t.string "description", limit: 4000
    t.integer "icon_id"
    t.bigint "ceo_id"
    t.bigint "integer_id"
    t.decimal "tax_rate", precision: 4, scale: 3
    t.decimal "decimal", precision: 4, scale: 3
    t.string "ticker", limit: 5
    t.string "name"
    t.bigint "creator_id"
    t.bigint "alliance_id"
    t.datetime "creation_date"
    t.integer "member_count"
    t.string "url"
    t.integer "deletion_status", default: 0, null: false
    t.string "icon_64"
    t.string "icon_128"
    t.string "icon_256"
    t.integer "corporation_type", default: 2, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["alliance_id"], name: "index_corporations_on_alliance_id"
    t.index ["ceo_id"], name: "index_corporations_on_ceo_id"
    t.index ["creator_id"], name: "index_corporations_on_creator_id"
    t.index ["enemy_id"], name: "index_corporations_on_enemy_id"
    t.index ["faction_id"], name: "index_corporations_on_faction_id"
    t.index ["friend_id"], name: "index_corporations_on_friend_id"
    t.index ["icon_id"], name: "index_corporations_on_icon_id"
    t.index ["integer_id"], name: "index_corporations_on_integer_id"
    t.index ["solar_system_id"], name: "index_corporations_on_solar_system_id"
  end

  create_table "crpActivities", primary_key: "activityID", id: :integer, default: nil, force: :cascade do |t|
    t.string "activityName", limit: 100
    t.string "description", limit: 1000
  end

  create_table "denormalized_map", primary_key: "item_id", id: :integer, default: nil, force: :cascade do |t|
    t.integer "type_id"
    t.integer "group_id"
    t.integer "solar_system_id"
    t.integer "constellation_id"
    t.integer "region_id"
    t.integer "orbit_id"
    t.float "x"
    t.float "y"
    t.float "z"
    t.float "radius"
    t.string "name", limit: 100
    t.float "security"
    t.integer "celestial_index"
    t.integer "orbit_index"
    t.index ["constellation_id"], name: "ix_mapDenormalize_constellationID"
    t.index ["group_id", "constellation_id"], name: "mapDenormalize_IX_groupConstellation"
    t.index ["group_id", "region_id"], name: "mapDenormalize_IX_groupRegion"
    t.index ["group_id", "solar_system_id"], name: "mapDenormalize_IX_groupSystem"
    t.index ["group_id"], name: "index_denormalized_map_on_group_id"
    t.index ["orbit_id"], name: "ix_mapDenormalize_orbitID"
    t.index ["region_id"], name: "ix_mapDenormalize_regionID"
    t.index ["solar_system_id"], name: "ix_mapDenormalize_solarSystemID"
    t.index ["type_id"], name: "ix_mapDenormalize_typeID"
  end

  create_table "dogma_attribute_categories", primary_key: "category_id", id: :integer, default: nil, force: :cascade do |t|
    t.string "name", limit: 50
    t.string "description", limit: 200
  end

  create_table "dogma_attribute_values", primary_key: ["type_id", "attribute_id"], force: :cascade do |t|
    t.integer "type_id", null: false
    t.integer "attribute_id", null: false
    t.integer "value_integer"
    t.float "value_float"
    t.index ["attribute_id"], name: "ix_dgmTypeAttributes_attributeID"
    t.index ["type_id"], name: "index_dogma_attribute_values_on_type_id"
  end

  create_table "dogma_attributes", primary_key: "attribute_id", id: :integer, default: nil, force: :cascade do |t|
    t.string "name", limit: 100
    t.string "description", limit: 1000
    t.integer "icon_id"
    t.float "default_value"
    t.string "display_name", limit: 150
    t.integer "unit_id"
    t.integer "category_id"
    t.integer "data_export", default: 1, null: false
    t.integer "stacking", default: 1, null: false
    t.integer "good", default: 1, null: false
    t.index ["category_id"], name: "index_dogma_attributes_on_category_id"
    t.index ["icon_id"], name: "index_dogma_attributes_on_icon_id"
  end

  create_table "dogma_effect_defaults", primary_key: ["type_id", "effect_id"], force: :cascade do |t|
    t.integer "type_id", null: false
    t.integer "effect_id", null: false
    t.boolean "default"
    t.index ["effect_id"], name: "index_dogma_effect_defaults_on_effect_id"
    t.index ["type_id"], name: "index_dogma_effect_defaults_on_type_id"
  end

  create_table "dogma_effects", primary_key: "effect_id", id: :integer, default: nil, force: :cascade do |t|
    t.string "effectName", limit: 400
    t.integer "effect_category"
    t.integer "pre_expression"
    t.integer "post_expression"
    t.string "description", limit: 1000
    t.string "guid", limit: 60
    t.integer "icon_id"
    t.boolean "offensive"
    t.boolean "assistance"
    t.integer "duration_attribute_id"
    t.integer "tracking_speed_attribute_id"
    t.integer "discharge_attribute_id"
    t.integer "range_attribute_id"
    t.integer "falloff_attribute_id"
    t.string "displayName", limit: 100
    t.boolean "range_chance"
    t.boolean "electronic_chance"
    t.boolean "propulsion_chance"
    t.integer "distribution"
    t.string "sfx_name", limit: 20
    t.integer "npc_usage_chance_attribute_id"
    t.integer "npc_activation_chance_attribute_id"
    t.integer "fitting_usage_chance_attribute_id"
    t.text "modifier_info"
    t.integer "auto_repeat", default: 0, null: false
    t.integer "data_export", default: 1, null: false
    t.integer "warp_safety", default: 0, null: false
    t.index ["discharge_attribute_id"], name: "index_dogma_effects_on_discharge_attribute_id"
    t.index ["duration_attribute_id"], name: "index_dogma_effects_on_duration_attribute_id"
    t.index ["falloff_attribute_id"], name: "index_dogma_effects_on_falloff_attribute_id"
    t.index ["icon_id"], name: "index_dogma_effects_on_icon_id"
    t.index ["post_expression"], name: "index_dogma_effects_on_post_expression"
    t.index ["pre_expression"], name: "index_dogma_effects_on_pre_expression"
    t.index ["range_attribute_id"], name: "index_dogma_effects_on_range_attribute_id"
    t.index ["tracking_speed_attribute_id"], name: "index_dogma_effects_on_tracking_speed_attribute_id"
  end

  create_table "dogma_expressions", primary_key: "expression_id", id: :integer, default: nil, force: :cascade do |t|
    t.integer "operand_id"
    t.integer "arg1"
    t.integer "arg2"
    t.string "value", limit: 100
    t.string "description", limit: 1000
    t.string "name", limit: 500
    t.integer "type_id"
    t.integer "item_group_id"
    t.integer "attribute_id"
    t.index ["attribute_id"], name: "index_dogma_expressions_on_attribute_id"
    t.index ["item_group_id"], name: "index_dogma_expressions_on_item_group_id"
    t.index ["type_id"], name: "index_dogma_expressions_on_type_id"
  end

  create_table "factions", primary_key: "faction_id", id: :integer, default: nil, force: :cascade do |t|
    t.string "name", limit: 100
    t.string "description", limit: 1000
    t.integer "race_id"
    t.integer "solar_system_id"
    t.integer "corporation_id"
    t.float "size_factor"
    t.integer "station_count"
    t.integer "station_system_count"
    t.integer "militia_corporation_id"
    t.integer "icon_id"
    t.integer "uniqueness", default: 1, null: false
    t.integer "member_race"
    t.index ["icon_id"], name: "index_factions_on_icon_id"
    t.index ["member_race"], name: "index_factions_on_member_race"
    t.index ["militia_corporation_id"], name: "index_factions_on_militia_corporation_id"
    t.index ["race_id"], name: "index_factions_on_race_id"
    t.index ["solar_system_id"], name: "index_factions_on_solar_system_id"
  end

  create_table "graphics", primary_key: "graphic_id", id: :integer, default: nil, force: :cascade do |t|
    t.string "sof_faction_name", limit: 100
    t.string "graphic_file", limit: 100
    t.string "sof_hull_name", limit: 100
    t.string "sof_race_name", limit: 100
    t.text "description"
  end

  create_table "icons", primary_key: "icon_id", id: :integer, default: nil, force: :cascade do |t|
    t.string "icon_file", limit: 500
    t.text "description"
  end

  create_table "industry_activities", primary_key: "activity_id", id: :integer, default: nil, force: :cascade do |t|
    t.string "name", limit: 100
    t.string "icon_number", limit: 5
    t.string "description", limit: 1000
    t.integer "data_export", default: 1, null: false
  end

  create_table "industry_facilities", primary_key: ["facility_id", "assembly_line_id"], force: :cascade do |t|
    t.integer "facility_id", null: false
    t.integer "assembly_line_id", null: false
    t.integer "quantity"
    t.integer "station_type_id"
    t.integer "owner_id"
    t.integer "solar_system_id"
    t.integer "region_id"
    t.float "tax"
    t.index ["owner_id"], name: "ix_ramAssemblyLineStations_ownerID"
    t.index ["region_id"], name: "ix_ramAssemblyLineStations_regionID"
    t.index ["solar_system_id"], name: "ix_ramAssemblyLineStations_solarSystemID"
  end

  create_table "industry_probabilities", id: false, force: :cascade do |t|
    t.integer "blueprint_id"
    t.integer "activity_type"
    t.integer "product_type_id"
    t.decimal "probability", precision: 3, scale: 2
    t.index ["activity_type"], name: "index_industry_probabilities_on_activity_type"
    t.index ["blueprint_id", "product_type_id"], name: "blueprint_product_type_id_index"
    t.index ["blueprint_id"], name: "ix_industryActivityProbabilities_typeID"
    t.index ["product_type_id"], name: "ix_industryActivityProbabilities_productTypeID"
  end

  create_table "industry_reactions", primary_key: ["reaction_type_id", "input", "reagent_id"], force: :cascade do |t|
    t.integer "reaction_type_id", null: false
    t.boolean "input", null: false
    t.integer "reagent_id", null: false
    t.integer "quantity"
    t.index ["reaction_type_id", "reagent_id"], name: "reaction_reagent_type_id_index"
    t.index ["reaction_type_id"], name: "index_industry_reactions_on_reaction_type_id"
    t.index ["reagent_id"], name: "index_industry_reactions_on_reagent_id"
  end

  create_table "industry_times", primary_key: ["blueprint_id", "activity_type"], force: :cascade do |t|
    t.integer "blueprint_id", null: false
    t.integer "activity_type", null: false
    t.integer "time"
    t.index ["activity_type"], name: "ix_industryActivity_activityID"
    t.index ["blueprint_id"], name: "index_industry_times_on_blueprint_id"
  end

  create_table "invControlTowerResourcePurposes", primary_key: "purpose", id: :integer, default: nil, force: :cascade do |t|
    t.string "purposeText", limit: 100
  end

  create_table "invControlTowerResources", primary_key: ["controlTowerTypeID", "resourceTypeID"], force: :cascade do |t|
    t.integer "controlTowerTypeID", null: false
    t.integer "resourceTypeID", null: false
    t.integer "purpose"
    t.integer "quantity"
    t.float "minSecurityLevel"
    t.integer "factionID"
  end

  create_table "inventory_flags", primary_key: "flag_id", id: :integer, default: nil, force: :cascade do |t|
    t.string "name", limit: 200
    t.string "description", limit: 100
    t.integer "order_id"
  end

  create_table "item_categories", primary_key: "category_id", id: :integer, default: nil, force: :cascade do |t|
    t.string "name", limit: 100
    t.integer "icon_id"
    t.integer "data_export", default: 1, null: false
    t.index ["icon_id"], name: "index_item_categories_on_icon_id"
  end

  create_table "item_groups", primary_key: "group_id", id: :integer, default: nil, force: :cascade do |t|
    t.integer "category_id"
    t.string "name", limit: 100
    t.integer "icon_id"
    t.boolean "base_price"
    t.boolean "anchored"
    t.boolean "anchorable"
    t.boolean "fit_multiple"
    t.integer "data_export", default: 1, null: false
    t.index ["category_id"], name: "ix_invGroups_categoryID"
    t.index ["icon_id"], name: "index_item_groups_on_icon_id"
  end

  create_table "item_materials", primary_key: ["type_id", "material_type_id"], force: :cascade do |t|
    t.integer "type_id", null: false
    t.integer "material_type_id", null: false
    t.integer "quantity", null: false
    t.index ["material_type_id"], name: "index_item_materials_on_material_type_id"
    t.index ["type_id"], name: "index_item_materials_on_type_id"
  end

  create_table "item_volumes", primary_key: "type_id", id: :integer, default: nil, force: :cascade do |t|
    t.integer "volume"
  end

  create_table "items", primary_key: "type_id", id: :integer, default: nil, force: :cascade do |t|
    t.integer "group_id"
    t.string "name", limit: 100
    t.text "description"
    t.float "mass"
    t.float "volume"
    t.float "capacity"
    t.integer "portion_size"
    t.integer "race_id"
    t.decimal "base_price", precision: 19, scale: 4
    t.integer "market_group_id"
    t.integer "icon_id"
    t.integer "sound_id"
    t.integer "graphic_id"
    t.string "type"
    t.integer "data_export", default: 1, null: false
    t.index ["group_id"], name: "ix_invTypes_groupID"
    t.index ["icon_id"], name: "index_items_on_icon_id"
  end

  create_table "landmarks", primary_key: "landmark_id", id: :integer, default: nil, force: :cascade do |t|
    t.string "name", limit: 100
    t.text "description"
    t.integer "solar_system_id"
    t.float "x"
    t.float "y"
    t.float "z"
    t.integer "icon_id"
  end

  create_table "market_groups", primary_key: "market_group_id", id: :integer, default: nil, force: :cascade do |t|
    t.integer "parent_group_id"
    t.string "name", limit: 100
    t.string "description", limit: 3000
    t.integer "icon_id"
    t.integer "contents", default: 1, null: false
    t.index ["icon_id"], name: "index_market_groups_on_icon_id"
    t.index ["parent_group_id"], name: "index_market_groups_on_parent_group_id"
  end

  create_table "meta_item_groups", primary_key: "meta_group_id", id: :integer, default: nil, force: :cascade do |t|
    t.string "name", limit: 100
    t.string "description", limit: 1000
    t.integer "icon_id"
    t.index ["icon_id"], name: "index_meta_item_groups_on_icon_id"
  end

  create_table "meta_variations", primary_key: "meta_type_id", id: :integer, default: nil, force: :cascade do |t|
    t.integer "base_type_id"
    t.integer "meta_group_id"
    t.index ["base_type_id", "meta_type_id"], name: "meta_base_type_id_index"
    t.index ["base_type_id"], name: "index_meta_variations_on_base_type_id"
    t.index ["meta_group_id"], name: "index_meta_variations_on_meta_group_id"
    t.index ["meta_type_id", "meta_group_id"], name: "meta_group_type_id_index"
  end

  create_table "npc_corp_divisions", primary_key: ["corporation_id", "division"], force: :cascade do |t|
    t.integer "corporation_id", null: false
    t.integer "division", null: false
    t.integer "size"
  end

  create_table "npc_corp_item_offers", primary_key: ["corporation_id", "type_id"], force: :cascade do |t|
    t.integer "corporation_id", null: false
    t.integer "type_id", null: false
    t.index ["corporation_id"], name: "index_npc_corp_item_offers_on_corporation_id"
    t.index ["type_id"], name: "index_npc_corp_item_offers_on_type_id"
  end

  create_table "npc_corp_research", primary_key: ["skill_type_id", "corporation_id"], force: :cascade do |t|
    t.integer "skill_type_id", null: false
    t.integer "corporation_id", null: false
    t.index ["corporation_id"], name: "index_npc_corp_research_on_corporation_id"
    t.index ["skill_type_id"], name: "index_npc_corp_research_on_skill_type_id"
  end

  create_table "pin_schematics", primary_key: ["schematic_id", "pin_type_id"], force: :cascade do |t|
    t.integer "schematic_id", null: false
    t.integer "pin_type_id", null: false
  end

  create_table "races", primary_key: "race_id", id: :integer, default: nil, force: :cascade do |t|
    t.string "name", limit: 100
    t.string "description", limit: 1000
    t.integer "icon_id"
    t.string "short_description", limit: 500
    t.index ["icon_id"], name: "index_races_on_icon_id"
  end

  create_table "ramInstallationTypeContents", primary_key: ["installationTypeID", "assemblyLineTypeID"], force: :cascade do |t|
    t.integer "installationTypeID", null: false
    t.integer "assemblyLineTypeID", null: false
    t.integer "quantity"
  end

  create_table "region_connections", primary_key: ["from_region_id", "to_region_id"], force: :cascade do |t|
    t.integer "from_region_id", null: false
    t.integer "to_region_id", null: false
    t.index ["from_region_id"], name: "index_region_connections_on_from_region_id"
    t.index ["to_region_id", "from_region_id"], name: "index_region_connections_on_to_region_id_and_from_region_id"
    t.index ["to_region_id"], name: "index_region_connections_on_to_region_id"
  end

  create_table "region_scenes", primary_key: "region_id", id: :integer, default: nil, force: :cascade do |t|
    t.integer "graphic_id"
    t.index ["graphic_id"], name: "index_region_scenes_on_graphic_id"
    t.index ["region_id", "graphic_id"], name: "index_region_scenes_on_region_id_and_graphic_id"
  end

  create_table "regions", primary_key: "region_id", id: :integer, default: nil, force: :cascade do |t|
    t.string "name", limit: 100
    t.float "x"
    t.float "y"
    t.float "z"
    t.float "x_min"
    t.float "x_max"
    t.float "y_min"
    t.float "y_max"
    t.float "z_min"
    t.float "z_max"
    t.integer "faction_id"
    t.float "radius"
    t.index ["faction_id"], name: "index_regions_on_faction_id"
  end

  create_table "research_agent_skills", primary_key: ["agent_id", "skill_type_id"], force: :cascade do |t|
    t.integer "agent_id", null: false
    t.integer "skill_type_id", null: false
    t.index ["agent_id"], name: "index_research_agent_skills_on_agent_id"
    t.index ["skill_type_id"], name: "ix_agtResearchAgents_typeID"
  end

  create_table "schematic_materials", primary_key: ["schematic_id", "material_id"], force: :cascade do |t|
    t.integer "schematic_id", null: false
    t.integer "material_id", null: false
    t.integer "quantity"
    t.boolean "input"
  end

  create_table "schematics", primary_key: "schematic_id", id: :integer, default: nil, force: :cascade do |t|
    t.string "name", limit: 255
    t.integer "cycle_time"
  end

  create_table "skinLicense", primary_key: "licenseTypeID", id: :integer, default: nil, force: :cascade do |t|
    t.integer "duration"
    t.integer "skinID"
  end

  create_table "skinMaterials", primary_key: "skinMaterialID", id: :integer, default: nil, force: :cascade do |t|
    t.integer "displayNameID"
    t.integer "materialSetID"
  end

  create_table "skinShip", id: false, force: :cascade do |t|
    t.integer "skinID"
    t.integer "typeID"
    t.index ["skinID"], name: "ix_skinShip_skinID"
    t.index ["typeID"], name: "ix_skinShip_typeID"
  end

  create_table "skins", primary_key: "skinID", id: :integer, default: nil, force: :cascade do |t|
    t.string "internalName", limit: 70
    t.integer "skinMaterialID"
  end

  create_table "solar_systems", primary_key: "system_id", id: :integer, default: nil, force: :cascade do |t|
    t.integer "region_id"
    t.integer "constellation_id"
    t.string "name", limit: 100
    t.float "x"
    t.float "y"
    t.float "z"
    t.float "x_min"
    t.float "x_max"
    t.float "y_min"
    t.float "y_max"
    t.float "z_min"
    t.float "z_max"
    t.float "luminosity"
    t.boolean "border"
    t.boolean "international"
    t.float "security_status"
    t.integer "faction_id"
    t.float "radius"
    t.integer "sun_type_id"
    t.string "security_class", limit: 2
    t.integer "jumps_last_hour"
    t.datetime "last_jumps_check"
    t.integer "npc_kills_last_hour"
    t.integer "pod_kills_last_hour"
    t.integer "ship_kills_last_hour"
    t.datetime "last_kills_check"
    t.bigint "corporation_id"
    t.bigint "alliance_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "topography", default: 3, null: false
    t.integer "links", default: 1, null: false
    t.index ["alliance_id"], name: "index_solar_systems_on_alliance_id"
    t.index ["constellation_id"], name: "ix_mapSolarSystems_constellationID"
    t.index ["corporation_id"], name: "index_solar_systems_on_corporation_id"
    t.index ["faction_id"], name: "index_solar_systems_on_faction_id"
    t.index ["region_id"], name: "ix_mapSolarSystems_regionID"
    t.index ["security_status"], name: "ix_mapSolarSystems_security"
    t.index ["sun_type_id"], name: "index_solar_systems_on_sun_type_id"
    t.index ["system_id", "alliance_id"], name: "index_solar_systems_on_system_id_and_alliance_id"
    t.index ["system_id", "constellation_id"], name: "index_solar_systems_on_system_id_and_constellation_id"
    t.index ["system_id", "corporation_id"], name: "index_solar_systems_on_system_id_and_corporation_id"
    t.index ["system_id", "faction_id"], name: "index_solar_systems_on_system_id_and_faction_id"
    t.index ["system_id", "region_id"], name: "index_solar_systems_on_system_id_and_region_id"
  end

  create_table "staOperationServices", primary_key: ["operationID", "serviceID"], force: :cascade do |t|
    t.integer "operationID", null: false
    t.integer "serviceID", null: false
  end

  create_table "staOperations", primary_key: "operationID", id: :integer, default: nil, force: :cascade do |t|
    t.integer "activityID"
    t.string "operationName", limit: 100
    t.string "description", limit: 1000
    t.integer "fringe"
    t.integer "corridor"
    t.integer "hub"
    t.integer "border"
    t.integer "ratio"
    t.integer "caldariStationTypeID"
    t.integer "minmatarStationTypeID"
    t.integer "amarrStationTypeID"
    t.integer "gallenteStationTypeID"
    t.integer "joveStationTypeID"
  end

  create_table "staServices", primary_key: "serviceID", id: :integer, default: nil, force: :cascade do |t|
    t.string "serviceName", limit: 100
    t.string "description", limit: 1000
  end

  create_table "staStationTypes", primary_key: "stationTypeID", id: :integer, default: nil, force: :cascade do |t|
    t.float "dockEntryX"
    t.float "dockEntryY"
    t.float "dockEntryZ"
    t.float "dockOrientationX"
    t.float "dockOrientationY"
    t.float "dockOrientationZ"
    t.integer "operationID"
    t.integer "officeSlots"
    t.float "reprocessingEfficiency"
    t.boolean "conquerable"
  end

  create_table "staStations", primary_key: "stationID", id: :bigint, default: nil, force: :cascade do |t|
    t.integer "security"
    t.float "dockingCostPerVolume"
    t.float "maxShipVolumeDockable"
    t.integer "officeRentalCost"
    t.integer "operationID"
    t.integer "stationTypeID"
    t.integer "corporationID"
    t.integer "solarSystemID"
    t.integer "constellationID"
    t.integer "regionID"
    t.string "stationName", limit: 100
    t.float "x"
    t.float "y"
    t.float "z"
    t.float "reprocessingEfficiency"
    t.float "reprocessingStationsTake"
    t.integer "reprocessingHangarFlag"
    t.index ["constellationID"], name: "ix_staStations_constellationID"
    t.index ["corporationID"], name: "ix_staStations_corporationID"
    t.index ["operationID"], name: "ix_staStations_operationID"
    t.index ["regionID"], name: "ix_staStations_regionID"
    t.index ["solarSystemID"], name: "ix_staStations_solarSystemID"
    t.index ["stationTypeID"], name: "ix_staStations_stationTypeID"
  end

  create_table "stargates", primary_key: "stargate_id", id: :integer, default: nil, force: :cascade do |t|
    t.integer "destination_stargate_id"
    t.bigint "destination_system_id"
    t.bigint "solar_system_id"
    t.bigint "stargate_type_id"
    t.string "name"
    t.float "x"
    t.float "y"
    t.float "z"
    t.index ["destination_stargate_id"], name: "index_stargates_on_destination_stargate_id"
    t.index ["destination_system_id"], name: "index_stargates_on_destination_system_id"
    t.index ["solar_system_id"], name: "index_stargates_on_solar_system_id"
    t.index ["stargate_id", "destination_stargate_id"], name: "index_stargates_on_stargate_id_and_destination_stargate_id"
    t.index ["stargate_id", "destination_system_id"], name: "index_stargates_on_stargate_id_and_destination_system_id"
    t.index ["stargate_type_id"], name: "index_stargates_on_stargate_type_id"
  end

  create_table "system_connections", primary_key: ["from_system_id", "to_system_id"], force: :cascade do |t|
    t.integer "from_system_id", null: false
    t.integer "to_system_id", null: false
    t.index ["from_system_id"], name: "index_system_connections_on_from_system_id"
    t.index ["to_system_id"], name: "index_system_connections_on_to_system_id"
  end

  create_table "training_attributes", primary_key: "attribute_id", id: :integer, default: nil, force: :cascade do |t|
    t.string "name", limit: 100
    t.string "description", limit: 1000
    t.integer "icon_id"
    t.string "short_description", limit: 500
    t.string "notes", limit: 500
    t.index ["icon_id"], name: "index_training_attributes_on_icon_id"
  end

  create_table "translationTables", primary_key: ["sourceTable", "translatedKey"], force: :cascade do |t|
    t.string "sourceTable", limit: 200, null: false
    t.string "destinationTable", limit: 200
    t.string "translatedKey", limit: 200, null: false
    t.integer "tcGroupID"
    t.integer "tcID"
  end

  create_table "trnTranslationColumns", primary_key: "tcID", id: :integer, default: nil, force: :cascade do |t|
    t.integer "tcGroupID"
    t.string "tableName", limit: 256, null: false
    t.string "columnName", limit: 128, null: false
    t.string "masterID", limit: 128
  end

  create_table "trnTranslationLanguages", primary_key: "numericLanguageID", id: :integer, default: nil, force: :cascade do |t|
    t.string "languageID", limit: 50
    t.string "languageName", limit: 200
  end

  create_table "trnTranslations", primary_key: ["tcID", "keyID", "languageID"], force: :cascade do |t|
    t.integer "tcID", null: false
    t.integer "keyID", null: false
    t.string "languageID", limit: 50, null: false
    t.text "text", null: false
  end

  create_table "units", primary_key: "unit_id", id: :integer, default: nil, force: :cascade do |t|
    t.string "name", limit: 100
    t.string "display_name", limit: 50
    t.string "description", limit: 1000
  end

  create_table "universe_entities", primary_key: "item_id", id: :integer, default: nil, force: :cascade do |t|
    t.string "name", limit: 200, null: false
  end

  create_table "universe_items", primary_key: "item_id", id: :integer, default: nil, force: :cascade do |t|
    t.integer "type_id", null: false
    t.integer "owner_id", null: false
    t.integer "location_id", null: false
    t.integer "flag_id", null: false
    t.integer "quantity", null: false
    t.string "location_type"
    t.string "owner_type", default: "UniverseEntity"
    t.index ["flag_id"], name: "index_universe_items_on_flag_id"
    t.index ["item_id", "type_id"], name: "index_universe_items_on_item_id_and_type_id"
    t.index ["location_id"], name: "ix_invItems_locationID"
    t.index ["location_type", "location_id"], name: "index_universe_items_on_location_type_and_location_id"
    t.index ["owner_id", "location_id"], name: "items_IX_OwnerLocation"
    t.index ["owner_id"], name: "index_universe_items_on_owner_id"
    t.index ["owner_type", "owner_id"], name: "index_universe_items_on_owner_type_and_owner_id"
    t.index ["type_id"], name: "index_universe_items_on_type_id"
  end

  create_table "universe_positions", primary_key: "item_id", id: :integer, default: nil, force: :cascade do |t|
    t.float "x", null: false
    t.float "y", null: false
    t.float "z", null: false
    t.float "yaw"
    t.float "pitch"
    t.float "roll"
  end

  create_table "universe_unique_names", primary_key: "item_id", id: :integer, default: nil, force: :cascade do |t|
    t.string "name", limit: 200, null: false
    t.integer "group_id"
    t.index ["group_id", "name"], name: "invUniqueNames_IX_GroupName"
    t.index ["item_id", "name"], name: "index_universe_unique_names_on_item_id_and_name"
    t.index ["name"], name: "ix_invUniqueNames_itemName", unique: true
  end

  create_table "universes", primary_key: "universe_id", id: :integer, default: nil, force: :cascade do |t|
    t.string "name", limit: 100
    t.float "x"
    t.float "y"
    t.float "z"
    t.float "x_min"
    t.float "x_max"
    t.float "y_min"
    t.float "y_max"
    t.float "z_min"
    t.float "z_max"
    t.float "radius"
  end

  create_table "warCombatZoneSystems", primary_key: "solarSystemID", id: :integer, default: nil, force: :cascade do |t|
    t.integer "combatZoneID"
  end

  create_table "warCombatZones", primary_key: "combatZoneID", id: :integer, default: nil, force: :cascade do |t|
    t.string "combatZoneName", limit: 100
    t.integer "factionID"
    t.integer "centerSystemID"
    t.string "description", limit: 500
  end

  create_table "wormhole_system_classes", primary_key: "location_id", id: :integer, default: nil, force: :cascade do |t|
    t.integer "class_id"
    t.string "location_type"
    t.index ["location_type", "location_id"], name: "wormhole_system_class_location_type_and_id"
  end

  add_foreign_key "agents", "corp_division_details", column: "division", primary_key: "division_id"
  add_foreign_key "ancestries", "bloodlines", primary_key: "bloodline_id"
  add_foreign_key "assembly_categories", "assembly_lines", primary_key: "assembly_line_id"
  add_foreign_key "assembly_categories", "item_categories", column: "category_id", primary_key: "category_id"
  add_foreign_key "assembly_groups", "assembly_lines", primary_key: "assembly_line_id"
  add_foreign_key "assembly_groups", "item_groups", column: "group_id", primary_key: "group_id"
  add_foreign_key "assembly_lines", "industry_activities", column: "activity_type", primary_key: "activity_id"
  add_foreign_key "bloodlines", "icons", primary_key: "icon_id"
  add_foreign_key "bloodlines", "items", column: "ship_type_id", primary_key: "type_id"
  add_foreign_key "bloodlines", "races", primary_key: "race_id"
  add_foreign_key "blueprint_materials", "industry_activities", column: "activity_type", primary_key: "activity_id"
  add_foreign_key "blueprint_products", "industry_activities", column: "activity_type", primary_key: "activity_id"
  add_foreign_key "blueprint_skills", "industry_activities", column: "activity_type", primary_key: "activity_id"
  add_foreign_key "blueprint_skills", "items", column: "skill_id", primary_key: "type_id"
  add_foreign_key "bonus_traits", "items", column: "skill_id", primary_key: "type_id"
  add_foreign_key "bonus_traits", "items", column: "type_id", primary_key: "type_id"
  add_foreign_key "bonus_traits", "units", primary_key: "unit_id"
  add_foreign_key "celestials", "universe_items", column: "celestial_id", primary_key: "item_id"
  add_foreign_key "certificate_masteries", "certificates", column: "cert_id", primary_key: "cert_id"
  add_foreign_key "certificate_masteries", "items", column: "type_id", primary_key: "type_id"
  add_foreign_key "certificate_skills", "certificates", column: "cert_id", primary_key: "cert_id"
  add_foreign_key "certificate_skills", "items", column: "skill_id", primary_key: "type_id"
  add_foreign_key "certificates", "item_groups", column: "group_id", primary_key: "group_id"
  add_foreign_key "constellation_connections", "constellations", column: "from_constellation_id", primary_key: "constellation_id"
  add_foreign_key "constellation_connections", "constellations", column: "to_constellation_id", primary_key: "constellation_id"
  add_foreign_key "constellations", "factions", primary_key: "faction_id"
  add_foreign_key "constellations", "regions", primary_key: "region_id"
  add_foreign_key "contraband", "factions", primary_key: "faction_id"
  add_foreign_key "contraband", "items", column: "type_id", primary_key: "type_id"
  add_foreign_key "corporations", "corporations", column: "enemy_id", primary_key: "corporation_id"
  add_foreign_key "corporations", "corporations", column: "friend_id", primary_key: "corporation_id"
  add_foreign_key "corporations", "factions", primary_key: "faction_id"
  add_foreign_key "corporations", "icons", primary_key: "icon_id"
  add_foreign_key "corporations", "solar_systems", primary_key: "system_id"
  add_foreign_key "denormalized_map", "constellations", primary_key: "constellation_id"
  add_foreign_key "denormalized_map", "item_groups", column: "group_id", primary_key: "group_id"
  add_foreign_key "denormalized_map", "items", column: "type_id", primary_key: "type_id"
  add_foreign_key "denormalized_map", "regions", primary_key: "region_id"
  add_foreign_key "denormalized_map", "solar_systems", primary_key: "system_id"
  add_foreign_key "denormalized_map", "universe_items", column: "item_id", primary_key: "item_id"
  add_foreign_key "denormalized_map", "universe_items", column: "orbit_id", primary_key: "item_id"
  add_foreign_key "dogma_attribute_values", "dogma_attributes", column: "attribute_id", primary_key: "attribute_id"
  add_foreign_key "dogma_attribute_values", "items", column: "type_id", primary_key: "type_id"
  add_foreign_key "dogma_attributes", "dogma_attribute_categories", column: "category_id", primary_key: "category_id"
  add_foreign_key "dogma_attributes", "icons", primary_key: "icon_id"
  add_foreign_key "dogma_attributes", "units", primary_key: "unit_id"
  add_foreign_key "dogma_effect_defaults", "dogma_effects", column: "effect_id", primary_key: "effect_id"
  add_foreign_key "dogma_effect_defaults", "items", column: "type_id", primary_key: "type_id"
  add_foreign_key "dogma_effects", "dogma_attributes", column: "discharge_attribute_id", primary_key: "attribute_id"
  add_foreign_key "dogma_effects", "dogma_attributes", column: "duration_attribute_id", primary_key: "attribute_id"
  add_foreign_key "dogma_effects", "dogma_attributes", column: "falloff_attribute_id", primary_key: "attribute_id"
  add_foreign_key "dogma_effects", "dogma_attributes", column: "fitting_usage_chance_attribute_id", primary_key: "attribute_id"
  add_foreign_key "dogma_effects", "dogma_attributes", column: "npc_activation_chance_attribute_id", primary_key: "attribute_id"
  add_foreign_key "dogma_effects", "dogma_attributes", column: "npc_usage_chance_attribute_id", primary_key: "attribute_id"
  add_foreign_key "dogma_effects", "dogma_attributes", column: "range_attribute_id", primary_key: "attribute_id"
  add_foreign_key "dogma_effects", "dogma_attributes", column: "tracking_speed_attribute_id", primary_key: "attribute_id"
  add_foreign_key "dogma_effects", "dogma_expressions", column: "post_expression", primary_key: "expression_id"
  add_foreign_key "dogma_effects", "dogma_expressions", column: "pre_expression", primary_key: "expression_id"
  add_foreign_key "dogma_effects", "icons", primary_key: "icon_id"
  add_foreign_key "dogma_expressions", "item_groups", primary_key: "group_id"
  add_foreign_key "factions", "corporations", column: "militia_corporation_id", primary_key: "corporation_id"
  add_foreign_key "factions", "icons", primary_key: "icon_id"
  add_foreign_key "factions", "races", primary_key: "race_id"
  add_foreign_key "factions", "solar_systems", primary_key: "system_id"
  add_foreign_key "industry_facilities", "assembly_lines", primary_key: "assembly_line_id"
  add_foreign_key "industry_facilities", "corporations", column: "owner_id", primary_key: "corporation_id"
  add_foreign_key "industry_facilities", "items", column: "station_type_id", primary_key: "type_id"
  add_foreign_key "industry_facilities", "regions", primary_key: "region_id"
  add_foreign_key "industry_facilities", "solar_systems", primary_key: "system_id"
  add_foreign_key "industry_probabilities", "industry_activities", column: "activity_type", primary_key: "activity_id"
  add_foreign_key "industry_reactions", "items", column: "reaction_type_id", primary_key: "type_id"
  add_foreign_key "industry_reactions", "items", column: "reagent_id", primary_key: "type_id"
  add_foreign_key "industry_times", "industry_activities", column: "activity_type", primary_key: "activity_id"
  add_foreign_key "item_categories", "icons", primary_key: "icon_id"
  add_foreign_key "item_groups", "icons", primary_key: "icon_id"
  add_foreign_key "item_groups", "item_categories", column: "category_id", primary_key: "category_id"
  add_foreign_key "item_materials", "items", column: "material_type_id", primary_key: "type_id"
  add_foreign_key "item_volumes", "items", column: "type_id", primary_key: "type_id"
  add_foreign_key "items", "graphics", primary_key: "graphic_id"
  add_foreign_key "items", "icons", primary_key: "icon_id"
  add_foreign_key "items", "item_groups", column: "group_id", primary_key: "group_id"
  add_foreign_key "items", "races", primary_key: "race_id"
  add_foreign_key "landmarks", "icons", primary_key: "icon_id"
  add_foreign_key "landmarks", "solar_systems", primary_key: "system_id"
  add_foreign_key "market_groups", "icons", primary_key: "icon_id"
  add_foreign_key "market_groups", "market_groups", column: "parent_group_id", primary_key: "market_group_id"
  add_foreign_key "meta_item_groups", "icons", primary_key: "icon_id"
  add_foreign_key "meta_variations", "items", column: "base_type_id", primary_key: "type_id"
  add_foreign_key "meta_variations", "items", column: "meta_type_id", primary_key: "type_id"
  add_foreign_key "meta_variations", "meta_item_groups", column: "meta_group_id", primary_key: "meta_group_id"
  add_foreign_key "npc_corp_divisions", "corp_division_details", column: "division", primary_key: "division_id"
  add_foreign_key "npc_corp_divisions", "corporations", primary_key: "corporation_id"
  add_foreign_key "npc_corp_item_offers", "corporations", primary_key: "corporation_id"
  add_foreign_key "npc_corp_item_offers", "items", column: "type_id", primary_key: "type_id"
  add_foreign_key "npc_corp_research", "corporations", primary_key: "corporation_id"
  add_foreign_key "npc_corp_research", "items", column: "skill_type_id", primary_key: "type_id"
  add_foreign_key "pin_schematics", "items", column: "pin_type_id", primary_key: "type_id"
  add_foreign_key "pin_schematics", "schematics", primary_key: "schematic_id"
  add_foreign_key "races", "icons", primary_key: "icon_id"
  add_foreign_key "region_connections", "regions", column: "from_region_id", primary_key: "region_id"
  add_foreign_key "region_connections", "regions", column: "to_region_id", primary_key: "region_id"
  add_foreign_key "region_scenes", "graphics", primary_key: "graphic_id"
  add_foreign_key "region_scenes", "regions", primary_key: "region_id"
  add_foreign_key "regions", "factions", primary_key: "faction_id"
  add_foreign_key "research_agent_skills", "agents", primary_key: "agent_id"
  add_foreign_key "research_agent_skills", "items", column: "skill_type_id", primary_key: "type_id"
  add_foreign_key "schematic_materials", "items", column: "material_id", primary_key: "type_id"
  add_foreign_key "schematic_materials", "schematics", primary_key: "schematic_id"
  add_foreign_key "solar_systems", "constellations", primary_key: "constellation_id"
  add_foreign_key "solar_systems", "factions", primary_key: "faction_id"
  add_foreign_key "solar_systems", "items", column: "sun_type_id", primary_key: "type_id"
  add_foreign_key "solar_systems", "regions", primary_key: "region_id"
  add_foreign_key "stargates", "items", column: "stargate_type_id", primary_key: "type_id"
  add_foreign_key "stargates", "solar_systems", column: "destination_system_id", primary_key: "system_id"
  add_foreign_key "stargates", "solar_systems", primary_key: "system_id"
  add_foreign_key "stargates", "stargates", column: "destination_stargate_id", primary_key: "stargate_id"
  add_foreign_key "system_connections", "solar_systems", column: "from_system_id", primary_key: "system_id"
  add_foreign_key "system_connections", "solar_systems", column: "to_system_id", primary_key: "system_id"
  add_foreign_key "training_attributes", "icons", primary_key: "icon_id"
  add_foreign_key "universe_entities", "universe_items", column: "item_id", primary_key: "item_id"
  add_foreign_key "universe_items", "inventory_flags", column: "flag_id", primary_key: "flag_id"
  add_foreign_key "universe_positions", "universe_items", column: "item_id", primary_key: "item_id"
  add_foreign_key "universe_unique_names", "item_groups", column: "group_id", primary_key: "group_id"
  add_foreign_key "universe_unique_names", "universe_items", column: "item_id", primary_key: "item_id"
end
