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

ActiveRecord::Schema.define(version: 20170701222049) do

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
    t.index ["agent_type"], name: "index_agents_on_agent_type"
    t.index ["corporation_id"], name: "ix_agtAgents_corporationID"
    t.index ["division"], name: "index_agents_on_division"
    t.index ["location_type", "location_id"], name: "index_agents_on_location_type_and_location_id"
  end

  create_table "alliance_histories", force: :cascade do |t|
    t.bigint "alliance_id", null: false
    t.bigint "corporation_id", null: false
    t.integer "record_id", null: false
    t.datetime "start_date", null: false
    t.index ["alliance_id"], name: "index_alliance_histories_on_alliance_id"
    t.index ["corporation_id", "alliance_id"], name: "index_alliance_histories_on_corporation_id_and_alliance_id"
    t.index ["corporation_id"], name: "index_alliance_histories_on_corporation_id"
  end

  create_table "alliances", id: false, force: :cascade do |t|
    t.integer "alliance_id", null: false
    t.bigint "executor_corporation_id", null: false
    t.string "ticker", limit: 5, null: false
    t.string "name", null: false
    t.datetime "date_founded", null: false
    t.integer "deletion_status"
    t.string "icon_64"
    t.string "icon_128"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["alliance_id"], name: "index_alliances_on_alliance_id", unique: true
    t.index ["deletion_status"], name: "index_alliances_on_deletion_status"
    t.index ["executor_corporation_id"], name: "index_alliances_on_executor_corporation_id", unique: true
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
    t.index ["bloodline_id"], name: "index_ancestries_on_bloodline_id"
    t.index ["icon_id"], name: "index_ancestries_on_icon_id"
  end

  create_table "assembly_categories", primary_key: ["assembly_line_id", "category_id"], force: :cascade do |t|
    t.integer "assembly_line_id", null: false
    t.integer "category_id", null: false
    t.float "time_multiplier"
    t.float "material_multiplier"
    t.float "cost_multiplier"
    t.index ["assembly_line_id"], name: "index_assembly_categories_on_assembly_line_id"
    t.index ["category_id"], name: "index_assembly_categories_on_category_id"
  end

  create_table "assembly_groups", primary_key: ["assembly_line_id", "group_id"], force: :cascade do |t|
    t.integer "assembly_line_id", null: false
    t.integer "group_id", null: false
    t.float "time_multiplier"
    t.float "material_multiplier"
    t.float "cost_multiplier"
    t.index ["assembly_line_id"], name: "index_assembly_groups_on_assembly_line_id"
    t.index ["group_id"], name: "index_assembly_groups_on_group_id"
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
    t.index ["activity_type"], name: "index_assembly_lines_on_activity_type"
  end

  create_table "asset_items", id: false, force: :cascade do |t|
    t.integer "item_id", null: false
    t.bigint "type_id", null: false
    t.integer "stack", default: 1, null: false
    t.string "location_flag", null: false
    t.string "location_type"
    t.bigint "location_id", null: false
    t.string "owner_type"
    t.bigint "owner_id", null: false
    t.integer "quantity"
    t.index ["item_id"], name: "index_asset_items_on_item_id", unique: true
    t.index ["location_type", "location_id"], name: "index_asset_items_on_location_type_and_location_id"
    t.index ["owner_type", "owner_id"], name: "index_asset_items_on_owner_type_and_owner_id"
    t.index ["stack"], name: "index_asset_items_on_stack"
    t.index ["type_id"], name: "index_asset_items_on_type_id"
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
    t.index ["type_id"], name: "index_bonus_traits_on_type_id"
    t.index ["unit_id"], name: "index_bonus_traits_on_unit_id"
  end

  create_table "bookmarks", id: false, force: :cascade do |t|
    t.integer "bookmark_id", null: false
    t.bigint "creator_id", null: false
    t.bigint "solar_system_id", null: false
    t.datetime "create_date", null: false
    t.bigint "folder_id"
    t.bigint "location_type_id"
    t.bigint "item_id"
    t.string "owner_type"
    t.bigint "owner_id"
    t.text "memo"
    t.text "note"
    t.float "x"
    t.float "y"
    t.float "z"
    t.index ["bookmark_id"], name: "index_bookmarks_on_bookmark_id", unique: true
    t.index ["creator_id"], name: "index_bookmarks_on_creator_id"
    t.index ["folder_id"], name: "index_bookmarks_on_folder_id"
    t.index ["item_id"], name: "index_bookmarks_on_item_id"
    t.index ["location_type_id"], name: "index_bookmarks_on_location_type_id"
    t.index ["owner_type", "owner_id"], name: "index_bookmarks_on_owner_type_and_owner_id"
    t.index ["solar_system_id"], name: "index_bookmarks_on_solar_system_id"
  end

  create_table "bookmarks_folders", id: false, force: :cascade do |t|
    t.integer "folder_id", null: false
    t.string "owner_type"
    t.bigint "owner_id"
    t.string "name"
    t.index ["folder_id"], name: "index_bookmarks_folders_on_folder_id", unique: true
    t.index ["owner_type", "owner_id"], name: "index_bookmarks_folders_on_owner_type_and_owner_id"
  end

  create_table "campaign_participants", id: false, force: :cascade do |t|
    t.bigint "campaign_id", null: false
    t.bigint "alliance_id", null: false
    t.integer "role", default: 3, null: false
    t.float "score", default: 0.0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["alliance_id"], name: "index_campaign_participants_on_alliance_id"
    t.index ["campaign_id"], name: "index_campaign_participants_on_campaign_id"
    t.index ["role"], name: "index_campaign_participants_on_role"
  end

  create_table "celestial_details", primary_key: "celestial_id", id: :integer, default: nil, force: :cascade do |t|
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
    t.index ["type_id"], name: "index_certificate_masteries_on_type_id"
  end

  create_table "certificate_skills", id: false, force: :cascade do |t|
    t.integer "cert_id"
    t.integer "skill_id"
    t.integer "certificate_level"
    t.integer "skill_level"
    t.integer "level_name"
    t.index ["cert_id"], name: "index_certificate_skills_on_cert_id"
    t.index ["level_name"], name: "index_certificate_skills_on_level_name"
    t.index ["skill_id"], name: "ix_certSkills_skillID"
  end

  create_table "certificates", primary_key: "cert_id", id: :integer, default: nil, force: :cascade do |t|
    t.text "description"
    t.integer "group_id"
    t.string "name", limit: 255
    t.index ["group_id"], name: "index_certificates_on_group_id"
  end

  create_table "channel_allows", id: false, force: :cascade do |t|
    t.bigint "channel_id", null: false
    t.string "allowed_type"
    t.bigint "allowed_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["allowed_type", "allowed_id"], name: "index_channel_allows_on_allowed_type_and_allowed_id"
    t.index ["channel_id"], name: "index_channel_allows_on_channel_id"
  end

  create_table "channel_blocks", id: false, force: :cascade do |t|
    t.bigint "channel_id", null: false
    t.string "blocked_type"
    t.bigint "blocked_id", null: false
    t.datetime "ends"
    t.text "reason"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["blocked_type", "blocked_id"], name: "index_channel_blocks_on_blocked_type_and_blocked_id"
    t.index ["channel_id"], name: "index_channel_blocks_on_channel_id"
  end

  create_table "channel_mutes", id: false, force: :cascade do |t|
    t.bigint "channel_id", null: false
    t.string "muted_type"
    t.bigint "muted_id", null: false
    t.datetime "ends"
    t.text "reason"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["channel_id"], name: "index_channel_mutes_on_channel_id"
    t.index ["muted_type", "muted_id"], name: "index_channel_mutes_on_muted_type_and_muted_id"
  end

  create_table "channel_operators", id: false, force: :cascade do |t|
    t.bigint "channel_id", null: false
    t.string "operator_type"
    t.bigint "operator_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["channel_id"], name: "index_channel_operators_on_channel_id"
    t.index ["operator_type", "operator_id"], name: "index_channel_operators_on_operator_type_and_operator_id"
  end

  create_table "character_opportunities", id: false, force: :cascade do |t|
    t.bigint "character_id", null: false
    t.bigint "task_id", null: false
    t.datetime "completed"
    t.index ["character_id", "task_id"], name: "index_character_opportunities_on_character_id_and_task_id"
    t.index ["character_id"], name: "index_character_opportunities_on_character_id"
    t.index ["task_id"], name: "index_character_opportunities_on_task_id"
  end

  create_table "character_skills", id: false, force: :cascade do |t|
    t.bigint "character_id", null: false
    t.bigint "skill_type_id", null: false
    t.integer "current_level", default: 0, null: false
    t.integer "skillpoints"
    t.integer "skill_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["character_id"], name: "index_character_skills_on_character_id"
    t.index ["skill_type_id"], name: "index_character_skills_on_skill_type_id"
  end

  create_table "characters", id: false, force: :cascade do |t|
    t.integer "character_id", null: false
    t.bigint "corporation_id", null: false
    t.integer "gender", default: 1, null: false
    t.string "name", null: false
    t.datetime "birthday", null: false
    t.bigint "race_id", null: false
    t.bigint "bloodline_id", null: false
    t.bigint "alliance_id"
    t.string "home_station_type"
    t.bigint "home_station_id"
    t.string "current_location_type"
    t.bigint "current_location_id"
    t.datetime "last_location_check"
    t.decimal "security_status"
    t.bigint "ancestry_id"
    t.text "description"
    t.datetime "last_clone_jump"
    t.integer "total_sp"
    t.string "portrait_64"
    t.string "portrait_128"
    t.string "portrait_256"
    t.string "portrait_512"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["alliance_id"], name: "index_characters_on_alliance_id"
    t.index ["ancestry_id"], name: "index_characters_on_ancestry_id"
    t.index ["bloodline_id"], name: "index_characters_on_bloodline_id"
    t.index ["character_id"], name: "index_characters_on_character_id", unique: true
    t.index ["corporation_id"], name: "index_characters_on_corporation_id"
    t.index ["current_location_type", "current_location_id"], name: "current_location_index"
    t.index ["home_station_type", "home_station_id"], name: "index_characters_on_home_station_type_and_home_station_id"
    t.index ["race_id"], name: "index_characters_on_race_id"
  end

  create_table "chat_channels", id: false, force: :cascade do |t|
    t.integer "channel_id", null: false
    t.integer "password", default: 0, null: false
    t.bigint "owner_id", null: false
    t.string "comparison_key", null: false
    t.string "name"
    t.text "motd"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["channel_id"], name: "index_chat_channels_on_channel_id", unique: true
    t.index ["owner_id"], name: "index_chat_channels_on_owner_id"
    t.index ["password"], name: "index_chat_channels_on_password"
  end

  create_table "colonies", force: :cascade do |t|
    t.bigint "planet_id", null: false
    t.bigint "owner_id", null: false
    t.bigint "solar_system_id", null: false
    t.integer "planet_type", null: false
    t.integer "pin_count"
    t.integer "upgrade_level"
    t.datetime "last_update"
    t.index ["owner_id"], name: "index_colonies_on_owner_id"
    t.index ["planet_id"], name: "index_colonies_on_planet_id"
    t.index ["planet_type"], name: "index_colonies_on_planet_type"
    t.index ["solar_system_id"], name: "index_colonies_on_solar_system_id"
  end

  create_table "colony_links", force: :cascade do |t|
    t.bigint "source_pin_id", null: false
    t.bigint "destination_pin_id", null: false
    t.integer "link_level", null: false
    t.index ["destination_pin_id"], name: "index_colony_links_on_destination_pin_id"
    t.index ["source_pin_id"], name: "index_colony_links_on_source_pin_id"
  end

  create_table "colony_pins", id: false, force: :cascade do |t|
    t.integer "pin_id", null: false
    t.bigint "colony_id", null: false
    t.bigint "type_id", null: false
    t.integer "status", default: 0, null: false
    t.bigint "product_type_id"
    t.bigint "schematic_id"
    t.float "latitude"
    t.float "longitude"
    t.integer "cycle_time"
    t.integer "quantity_per_cycle"
    t.float "head_radius"
    t.datetime "installed"
    t.datetime "last_cycle_start"
    t.datetime "expires"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["colony_id"], name: "index_colony_pins_on_colony_id"
    t.index ["pin_id"], name: "index_colony_pins_on_pin_id", unique: true
    t.index ["product_type_id"], name: "index_colony_pins_on_product_type_id"
    t.index ["schematic_id"], name: "index_colony_pins_on_schematic_id"
    t.index ["status"], name: "index_colony_pins_on_status"
    t.index ["type_id"], name: "index_colony_pins_on_type_id"
  end

  create_table "colony_routes", id: false, force: :cascade do |t|
    t.integer "route_id", null: false
    t.bigint "source_pin_id", null: false
    t.bigint "destination_pin_id", null: false
    t.string "content_type"
    t.bigint "content_id"
    t.float "quantity"
    t.index ["content_type", "content_id"], name: "index_colony_routes_on_content_type_and_content_id"
    t.index ["destination_pin_id"], name: "index_colony_routes_on_destination_pin_id"
    t.index ["route_id"], name: "index_colony_routes_on_route_id", unique: true
    t.index ["source_pin_id"], name: "index_colony_routes_on_source_pin_id"
  end

  create_table "colony_waypoints", force: :cascade do |t|
    t.bigint "pin_id", null: false
    t.bigint "route_id", null: false
    t.integer "order"
    t.index ["pin_id"], name: "index_colony_waypoints_on_pin_id"
    t.index ["route_id"], name: "index_colony_waypoints_on_route_id"
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

  create_table "contact_labels", id: false, force: :cascade do |t|
    t.integer "label_id", null: false
    t.bigint "character_id", null: false
    t.string "name"
    t.index ["character_id"], name: "index_contact_labels_on_character_id"
    t.index ["label_id"], name: "index_contact_labels_on_label_id", unique: true
  end

  create_table "contacts", id: false, force: :cascade do |t|
    t.string "diplomacy_type"
    t.bigint "diplomacy_id", null: false
    t.bigint "character_id", null: false
    t.integer "blocklist", default: 0, null: false
    t.integer "watchlist", default: 0, null: false
    t.bigint "label_id"
    t.float "standing"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["blocklist"], name: "index_contacts_on_blocklist"
    t.index ["character_id"], name: "index_contacts_on_character_id"
    t.index ["diplomacy_type", "diplomacy_id"], name: "index_contacts_on_diplomacy_type_and_diplomacy_id"
    t.index ["label_id"], name: "index_contacts_on_label_id"
    t.index ["watchlist"], name: "index_contacts_on_watchlist"
  end

  create_table "contraband", primary_key: ["faction_id", "type_id"], force: :cascade do |t|
    t.integer "faction_id", null: false
    t.integer "type_id", null: false
    t.float "standing_loss"
    t.float "confiscate"
    t.float "fine_by_value"
    t.float "attack"
    t.index ["faction_id"], name: "index_contraband_on_faction_id"
    t.index ["type_id"], name: "ix_invContrabandTypes_typeID"
  end

  create_table "corp_division_details", primary_key: "division_id", id: :integer, default: nil, force: :cascade do |t|
    t.string "name", limit: 100
    t.string "description", limit: 1000
    t.string "leader_title", limit: 100
  end

  create_table "corporation_histories", id: false, force: :cascade do |t|
    t.bigint "character_id", null: false
    t.bigint "corporation_id", null: false
    t.integer "record_id", null: false
    t.datetime "start_date", null: false
    t.index ["character_id"], name: "index_corporation_histories_on_character_id"
    t.index ["corporation_id"], name: "index_corporation_histories_on_corporation_id"
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
    t.index ["solar_system_id"], name: "index_corporations_on_solar_system_id"
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

  create_table "dockable_structures", primary_key: "dockable_id", id: :bigint, default: nil, force: :cascade do |t|
    t.integer "security"
    t.float "max_ship_volume"
    t.integer "office_rental_cost"
    t.integer "operation_id"
    t.integer "station_type_id"
    t.integer "owner_id"
    t.integer "solar_system_id"
    t.integer "constellation_id"
    t.integer "region_id"
    t.string "name", limit: 100
    t.float "x"
    t.float "y"
    t.float "z"
    t.float "reprocessing_efficiency"
    t.float "reprocessing_take"
    t.integer "reprocessing_hangar_flag"
    t.string "type"
    t.index ["constellation_id"], name: "ix_staStations_constellationID"
    t.index ["operation_id"], name: "ix_staStations_operationID"
    t.index ["owner_id"], name: "ix_staStations_corporationID"
    t.index ["region_id"], name: "ix_staStations_regionID"
    t.index ["solar_system_id"], name: "ix_staStations_solarSystemID"
    t.index ["station_type_id"], name: "ix_staStations_stationTypeID"
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
    t.index ["data_export"], name: "index_dogma_attributes_on_data_export"
    t.index ["good"], name: "index_dogma_attributes_on_good"
    t.index ["icon_id"], name: "index_dogma_attributes_on_icon_id"
    t.index ["stacking"], name: "index_dogma_attributes_on_stacking"
    t.index ["unit_id"], name: "index_dogma_attributes_on_unit_id"
  end

  create_table "dogma_effect_defaults", primary_key: ["type_id", "effect_id"], force: :cascade do |t|
    t.integer "type_id", null: false
    t.integer "effect_id", null: false
    t.boolean "default"
    t.index ["effect_id"], name: "index_dogma_effect_defaults_on_effect_id"
    t.index ["type_id"], name: "index_dogma_effect_defaults_on_type_id"
  end

  create_table "dogma_effect_modifications", id: false, force: :cascade do |t|
    t.bigint "effect_id", null: false
    t.bigint "modified_attribute_id"
    t.bigint "modifying_attribute_id"
    t.string "domain"
    t.string "func"
    t.integer "operator"
    t.index ["effect_id"], name: "index_dogma_effect_modifications_on_effect_id"
    t.index ["modified_attribute_id"], name: "index_dogma_effect_modifications_on_modified_attribute_id"
    t.index ["modifying_attribute_id"], name: "index_dogma_effect_modifications_on_modifying_attribute_id"
  end

  create_table "dogma_effects", primary_key: "effect_id", id: :integer, default: nil, force: :cascade do |t|
    t.string "name", limit: 400
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
    t.string "display_name", limit: 100
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
    t.index ["auto_repeat"], name: "index_dogma_effects_on_auto_repeat"
    t.index ["data_export"], name: "index_dogma_effects_on_data_export"
    t.index ["discharge_attribute_id"], name: "index_dogma_effects_on_discharge_attribute_id"
    t.index ["duration_attribute_id"], name: "index_dogma_effects_on_duration_attribute_id"
    t.index ["falloff_attribute_id"], name: "index_dogma_effects_on_falloff_attribute_id"
    t.index ["fitting_usage_chance_attribute_id"], name: "fitting_usage_chance_index"
    t.index ["guid"], name: "index_dogma_effects_on_guid"
    t.index ["icon_id"], name: "index_dogma_effects_on_icon_id"
    t.index ["npc_activation_chance_attribute_id"], name: "npc_activation_chance_index"
    t.index ["npc_usage_chance_attribute_id"], name: "npc_usage_change_index"
    t.index ["post_expression"], name: "index_dogma_effects_on_post_expression"
    t.index ["pre_expression"], name: "index_dogma_effects_on_pre_expression"
    t.index ["range_attribute_id"], name: "index_dogma_effects_on_range_attribute_id"
    t.index ["tracking_speed_attribute_id"], name: "index_dogma_effects_on_tracking_speed_attribute_id"
    t.index ["warp_safety"], name: "index_dogma_effects_on_warp_safety"
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

  create_table "evemails", id: false, force: :cascade do |t|
    t.integer "mail_id", null: false
    t.bigint "from_id", null: false
    t.integer "approved_cost", default: 0, null: false
    t.datetime "timestamp"
    t.string "subject"
    t.text "body"
    t.index ["from_id"], name: "index_evemails_on_from_id"
    t.index ["mail_id"], name: "index_evemails_on_mail_id", unique: true
  end

  create_table "event_responses", id: false, force: :cascade do |t|
    t.bigint "event_id", null: false
    t.bigint "character_id", null: false
    t.integer "response", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["character_id", "event_id"], name: "index_event_responses_on_character_id_and_event_id"
    t.index ["character_id"], name: "index_event_responses_on_character_id"
    t.index ["event_id"], name: "index_event_responses_on_event_id"
    t.index ["response"], name: "index_event_responses_on_response"
  end

  create_table "events", id: false, force: :cascade do |t|
    t.integer "event_id", null: false
    t.integer "importance", default: 0, null: false
    t.datetime "date", null: false
    t.string "host_type"
    t.bigint "host_id"
    t.integer "duration"
    t.text "description"
    t.string "title"
    t.string "host_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_events_on_event_id", unique: true
    t.index ["host_type", "host_id"], name: "index_events_on_host_type_and_host_id"
    t.index ["importance"], name: "index_events_on_importance"
  end

  create_table "extractor_heads", id: false, force: :cascade do |t|
    t.integer "head_id", null: false
    t.bigint "pin_id", null: false
    t.float "latitude"
    t.float "longitude"
    t.index ["head_id"], name: "index_extractor_heads_on_head_id", unique: true
    t.index ["pin_id"], name: "index_extractor_heads_on_pin_id"
  end

  create_table "faction_warfare_systems", primary_key: "system_id", id: :integer, default: nil, force: :cascade do |t|
    t.integer "combat_zone"
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
    t.index ["militia_corporation_id"], name: "index_factions_on_militia_corporation_id"
    t.index ["race_id"], name: "index_factions_on_race_id"
    t.index ["solar_system_id"], name: "index_factions_on_solar_system_id"
    t.index ["uniqueness"], name: "index_factions_on_uniqueness"
  end

  create_table "fitting_items", id: false, force: :cascade do |t|
    t.bigint "fitting_id", null: false
    t.bigint "type_id", null: false
    t.integer "flag"
    t.integer "quantity"
    t.index ["fitting_id"], name: "index_fitting_items_on_fitting_id"
    t.index ["type_id"], name: "index_fitting_items_on_type_id"
  end

  create_table "fittings", id: false, force: :cascade do |t|
    t.integer "fitting_id", null: false
    t.bigint "ship_type_id", null: false
    t.bigint "creator_id"
    t.string "name"
    t.text "description"
    t.index ["creator_id"], name: "index_fittings_on_creator_id"
    t.index ["fitting_id"], name: "index_fittings_on_fitting_id", unique: true
    t.index ["ship_type_id"], name: "index_fittings_on_ship_type_id"
  end

  create_table "fleet_memberships", id: false, force: :cascade do |t|
    t.bigint "character_id", null: false
    t.bigint "fleet_id", null: false
    t.bigint "wing_id", null: false
    t.bigint "squad_id", null: false
    t.bigint "ship_type_id", null: false
    t.bigint "solar_system_id", null: false
    t.integer "fleet_warp", default: 1, null: false
    t.integer "role", default: 1, null: false
    t.datetime "join_time", null: false
    t.string "role_name", null: false
    t.string "dock_type"
    t.bigint "dock_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["character_id"], name: "index_fleet_memberships_on_character_id"
    t.index ["dock_type", "dock_id"], name: "index_fleet_memberships_on_dock_type_and_dock_id"
    t.index ["fleet_id", "character_id"], name: "index_fleet_memberships_on_fleet_id_and_character_id"
    t.index ["fleet_id"], name: "index_fleet_memberships_on_fleet_id"
    t.index ["fleet_warp"], name: "index_fleet_memberships_on_fleet_warp"
    t.index ["role"], name: "index_fleet_memberships_on_role"
    t.index ["ship_type_id"], name: "index_fleet_memberships_on_ship_type_id"
    t.index ["solar_system_id"], name: "index_fleet_memberships_on_solar_system_id"
    t.index ["squad_id"], name: "index_fleet_memberships_on_squad_id"
    t.index ["wing_id"], name: "index_fleet_memberships_on_wing_id"
  end

  create_table "fleets", id: false, force: :cascade do |t|
    t.integer "fleet_id", null: false
    t.integer "free_move", default: 1, null: false
    t.integer "fleet_ad", default: 0, null: false
    t.integer "eve_voice", default: 0, null: false
    t.text "motd"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["eve_voice"], name: "index_fleets_on_eve_voice"
    t.index ["fleet_ad"], name: "index_fleets_on_fleet_ad"
    t.index ["fleet_id"], name: "index_fleets_on_fleet_id", unique: true
    t.index ["free_move"], name: "index_fleets_on_free_move"
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

  create_table "incursions", force: :cascade do |t|
    t.bigint "constellation_id", null: false
    t.bigint "staging_system_id", null: false
    t.bigint "faction_id", default: 500019, null: false
    t.integer "state", default: 1, null: false
    t.integer "mothership", default: 0, null: false
    t.string "type", default: "Incursion", null: false
    t.float "influence", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["constellation_id"], name: "index_incursions_on_constellation_id"
    t.index ["faction_id"], name: "index_incursions_on_faction_id"
    t.index ["mothership"], name: "index_incursions_on_mothership"
    t.index ["staging_system_id"], name: "index_incursions_on_staging_system_id"
    t.index ["state"], name: "index_incursions_on_state"
  end

  create_table "industry_activities", primary_key: "activity_id", id: :integer, default: nil, force: :cascade do |t|
    t.string "name", limit: 100
    t.string "icon_number", limit: 5
    t.string "description", limit: 1000
    t.integer "data_export", default: 1, null: false
    t.index ["data_export"], name: "index_industry_activities_on_data_export"
  end

  create_table "industry_cost_indices", id: false, force: :cascade do |t|
    t.bigint "system_id", null: false
    t.decimal "invention"
    t.decimal "manufacturing"
    t.decimal "time_efficiency"
    t.decimal "material_efficiency"
    t.decimal "copying"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["system_id"], name: "index_industry_cost_indices_on_system_id", unique: true
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
    t.index ["assembly_line_id"], name: "index_industry_facilities_on_assembly_line_id"
    t.index ["facility_id"], name: "index_industry_facilities_on_facility_id"
    t.index ["owner_id"], name: "ix_ramAssemblyLineStations_ownerID"
    t.index ["region_id"], name: "ix_ramAssemblyLineStations_regionID"
    t.index ["solar_system_id"], name: "ix_ramAssemblyLineStations_solarSystemID"
    t.index ["station_type_id"], name: "index_industry_facilities_on_station_type_id"
  end

  create_table "industry_installations", primary_key: ["installation_type_id", "assembly_line_id"], force: :cascade do |t|
    t.integer "installation_type_id", null: false
    t.integer "assembly_line_id", null: false
    t.integer "quantity"
    t.index ["assembly_line_id"], name: "index_industry_installations_on_assembly_line_id"
    t.index ["installation_type_id"], name: "index_industry_installations_on_installation_type_id"
  end

  create_table "industry_jobs", id: false, force: :cascade do |t|
    t.integer "job_id", null: false
    t.integer "activity_type", null: false
    t.integer "blueprint_id", null: false
    t.bigint "blueprint_type_id", null: false
    t.bigint "facility_id", null: false
    t.bigint "installer_id", null: false
    t.bigint "completed_character_id"
    t.string "product_type_type"
    t.bigint "product_type_id"
    t.string "job_blueprint_location_type"
    t.bigint "job_blueprint_location_id", null: false
    t.string "output_location_type"
    t.bigint "output_location_id", null: false
    t.string "job_location_type"
    t.bigint "job_location_id", null: false
    t.decimal "cost"
    t.float "probability"
    t.string "status"
    t.integer "runs"
    t.integer "licensed_runs"
    t.integer "successful_runs"
    t.integer "duration"
    t.datetime "start_date"
    t.datetime "pause_date"
    t.datetime "completed_date"
    t.datetime "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["activity_type"], name: "index_industry_jobs_on_activity_type"
    t.index ["blueprint_id"], name: "index_industry_jobs_on_blueprint_id"
    t.index ["blueprint_type_id"], name: "index_industry_jobs_on_blueprint_type_id"
    t.index ["completed_character_id"], name: "index_industry_jobs_on_completed_character_id"
    t.index ["facility_id"], name: "index_industry_jobs_on_facility_id"
    t.index ["installer_id"], name: "index_industry_jobs_on_installer_id"
    t.index ["job_blueprint_location_type", "job_blueprint_location_id"], name: "job_blueprint_location_index"
    t.index ["job_id"], name: "index_industry_jobs_on_job_id", unique: true
    t.index ["job_location_type", "job_location_id"], name: "job_location_index"
    t.index ["output_location_type", "output_location_id"], name: "output_location_index"
    t.index ["product_type_type", "product_type_id"], name: "index_industry_jobs_on_product_type_type_and_product_type_id"
  end

  create_table "industry_probabilities", id: false, force: :cascade do |t|
    t.integer "blueprint_id"
    t.integer "activity_type"
    t.integer "product_type_id"
    t.decimal "probability", precision: 3, scale: 2
    t.index ["activity_type"], name: "index_industry_probabilities_on_activity_type"
    t.index ["blueprint_id"], name: "ix_industryActivityProbabilities_typeID"
    t.index ["product_type_id"], name: "ix_industryActivityProbabilities_productTypeID"
  end

  create_table "industry_reactions", primary_key: ["reaction_type_id", "input", "reagent_id"], force: :cascade do |t|
    t.integer "reaction_type_id", null: false
    t.boolean "input", null: false
    t.integer "reagent_id", null: false
    t.integer "quantity"
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

  create_table "infested_systems", id: false, force: :cascade do |t|
    t.bigint "incursion_id", null: false
    t.bigint "solar_system_id", null: false
    t.integer "type", default: 2, null: false
    t.index ["incursion_id"], name: "index_infested_systems_on_incursion_id"
    t.index ["solar_system_id"], name: "index_infested_systems_on_solar_system_id"
    t.index ["type"], name: "index_infested_systems_on_type"
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
    t.index ["data_export"], name: "index_item_categories_on_data_export"
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
    t.index ["data_export"], name: "index_item_groups_on_data_export"
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
    t.index ["data_export"], name: "index_items_on_data_export"
    t.index ["graphic_id"], name: "index_items_on_graphic_id"
    t.index ["group_id"], name: "ix_invTypes_groupID"
    t.index ["icon_id"], name: "index_items_on_icon_id"
    t.index ["market_group_id"], name: "index_items_on_market_group_id"
    t.index ["race_id"], name: "index_items_on_race_id"
  end

  create_table "killmail_attackers", id: false, force: :cascade do |t|
    t.bigint "killmail_id", null: false
    t.string "attacker_type"
    t.bigint "attacker_id", null: false
    t.bigint "attacker_corporation_id"
    t.bigint "attacker_alliance_id"
    t.bigint "attacker_faction_id"
    t.bigint "ship_type_id"
    t.bigint "weapon_type_id"
    t.decimal "security_status"
    t.integer "damage_dealt"
    t.index ["attacker_alliance_id"], name: "index_killmail_attackers_on_attacker_alliance_id"
    t.index ["attacker_corporation_id"], name: "index_killmail_attackers_on_attacker_corporation_id"
    t.index ["attacker_faction_id"], name: "index_killmail_attackers_on_attacker_faction_id"
    t.index ["attacker_type", "attacker_id"], name: "killmail_attackers-index"
    t.index ["killmail_id"], name: "index_killmail_attackers_on_killmail_id"
    t.index ["ship_type_id"], name: "index_killmail_attackers_on_ship_type_id"
    t.index ["weapon_type_id"], name: "index_killmail_attackers_on_weapon_type_id"
  end

  create_table "killmail_items", force: :cascade do |t|
    t.bigint "killmail_id", null: false
    t.integer "stack", default: 1, null: false
    t.bigint "type_id", null: false
    t.bigint "killmail_item_id"
    t.integer "flag"
    t.integer "quantity_destroyed"
    t.integer "quantity_dropped"
    t.float "total_value"
    t.float "dropped_value"
    t.float "destroyed_value"
    t.index ["killmail_id"], name: "index_killmail_items_on_killmail_id"
    t.index ["killmail_item_id"], name: "index_killmail_items_on_killmail_item_id"
    t.index ["stack"], name: "index_killmail_items_on_stack"
    t.index ["type_id"], name: "index_killmail_items_on_type_id"
  end

  create_table "killmails", id: false, force: :cascade do |t|
    t.integer "killmail_id", null: false
    t.bigint "victim_id", null: false
    t.bigint "solar_system_id", null: false
    t.bigint "victim_ship_type_id", null: false
    t.bigint "victim_corporation_id"
    t.bigint "victim_alliance_id"
    t.bigint "victim_faction_id"
    t.bigint "moon_id"
    t.bigint "war_id"
    t.string "final_blow_type"
    t.bigint "final_blow_id", null: false
    t.datetime "time"
    t.integer "damage_taken"
    t.float "total_value"
    t.float "dropped_value"
    t.float "destroyed_value"
    t.float "x"
    t.float "y"
    t.float "z"
    t.index ["final_blow_type", "final_blow_id"], name: "index_killmails_on_final_blow_type_and_final_blow_id"
    t.index ["killmail_id"], name: "index_killmails_on_killmail_id", unique: true
    t.index ["moon_id"], name: "index_killmails_on_moon_id"
    t.index ["solar_system_id"], name: "index_killmails_on_solar_system_id"
    t.index ["victim_alliance_id"], name: "index_killmails_on_victim_alliance_id"
    t.index ["victim_corporation_id"], name: "index_killmails_on_victim_corporation_id"
    t.index ["victim_faction_id"], name: "index_killmails_on_victim_faction_id"
    t.index ["victim_id"], name: "index_killmails_on_victim_id"
    t.index ["victim_ship_type_id"], name: "index_killmails_on_victim_ship_type_id"
    t.index ["war_id"], name: "index_killmails_on_war_id"
  end

  create_table "landmarks", primary_key: "landmark_id", id: :integer, default: nil, force: :cascade do |t|
    t.string "name", limit: 100
    t.text "description"
    t.integer "solar_system_id"
    t.float "x"
    t.float "y"
    t.float "z"
    t.integer "icon_id"
    t.index ["icon_id"], name: "index_landmarks_on_icon_id"
    t.index ["solar_system_id"], name: "index_landmarks_on_solar_system_id"
  end

  create_table "languages", primary_key: "numeric_language_id", id: :integer, default: nil, force: :cascade do |t|
    t.string "string_language_id", limit: 50
    t.string "name", limit: 200
  end

  create_table "mail_label_assignments", id: false, force: :cascade do |t|
    t.bigint "label_id", null: false
    t.bigint "evemail_id", null: false
    t.index ["evemail_id"], name: "index_mail_label_assignments_on_evemail_id"
    t.index ["label_id", "evemail_id"], name: "mail_label_assignments_index"
    t.index ["label_id"], name: "index_mail_label_assignments_on_label_id"
  end

  create_table "mail_labels", id: false, force: :cascade do |t|
    t.integer "label_id", null: false
    t.string "color", default: "#ffffff", null: false
    t.integer "unread_count", default: 0, null: false
    t.bigint "character_id"
    t.string "name"
    t.index ["character_id"], name: "index_mail_labels_on_character_id"
    t.index ["label_id"], name: "index_mail_labels_on_label_id", unique: true
  end

  create_table "mail_recipients", id: false, force: :cascade do |t|
    t.bigint "recipient_id", null: false
    t.bigint "evemail_id", null: false
    t.integer "status", default: 0, null: false
    t.index ["evemail_id"], name: "index_mail_recipients_on_evemail_id"
    t.index ["recipient_id", "evemail_id"], name: "index_mail_recipients_on_recipient_id_and_evemail_id"
    t.index ["recipient_id"], name: "index_mail_recipients_on_recipient_id"
  end

  create_table "mailing_list_subscriptions", id: false, force: :cascade do |t|
    t.bigint "mailing_list_id", null: false
    t.bigint "subscriber_id", null: false
    t.index ["mailing_list_id"], name: "index_mailing_list_subscriptions_on_mailing_list_id"
    t.index ["subscriber_id", "mailing_list_id"], name: "mailing_list_subscription_index"
    t.index ["subscriber_id"], name: "index_mailing_list_subscriptions_on_subscriber_id"
  end

  create_table "mailing_lists", id: false, force: :cascade do |t|
    t.integer "mailing_list_id", null: false
    t.bigint "creator_id"
    t.string "name"
    t.index ["creator_id"], name: "index_mailing_lists_on_creator_id"
    t.index ["mailing_list_id"], name: "index_mailing_lists_on_mailing_list_id", unique: true
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

  create_table "medal_awards", id: false, force: :cascade do |t|
    t.bigint "character_id", null: false
    t.bigint "medal_id", null: false
    t.bigint "issuer_id", null: false
    t.integer "viewable", default: 1, null: false
    t.datetime "date", null: false
    t.text "reason"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["character_id", "medal_id"], name: "index_medal_awards_on_character_id_and_medal_id"
    t.index ["character_id"], name: "index_medal_awards_on_character_id"
    t.index ["issuer_id"], name: "index_medal_awards_on_issuer_id"
    t.index ["medal_id"], name: "index_medal_awards_on_medal_id"
    t.index ["viewable"], name: "index_medal_awards_on_viewable"
  end

  create_table "medals", id: false, force: :cascade do |t|
    t.integer "medal_id", null: false
    t.bigint "corporation_id", null: false
    t.string "title", null: false
    t.string "graphic", null: false
    t.integer "layer", null: false
    t.integer "part", null: false
    t.text "description"
    t.integer "color"
    t.index ["corporation_id"], name: "index_medals_on_corporation_id"
    t.index ["medal_id"], name: "index_medals_on_medal_id", unique: true
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
    t.index ["base_type_id"], name: "index_meta_variations_on_base_type_id"
    t.index ["meta_group_id"], name: "index_meta_variations_on_meta_group_id"
  end

  create_table "moons", id: false, force: :cascade do |t|
    t.integer "moon_id", null: false
    t.bigint "planet_id", null: false
    t.bigint "solar_system_id", null: false
    t.string "name"
    t.float "x"
    t.float "y"
    t.float "z"
    t.index ["moon_id"], name: "index_moons_on_moon_id", unique: true
    t.index ["planet_id"], name: "index_moons_on_planet_id"
    t.index ["solar_system_id"], name: "index_moons_on_solar_system_id"
  end

  create_table "npc_corp_divisions", primary_key: ["corporation_id", "division"], force: :cascade do |t|
    t.integer "corporation_id", null: false
    t.integer "division", null: false
    t.integer "size"
    t.index ["corporation_id"], name: "index_npc_corp_divisions_on_corporation_id"
    t.index ["division"], name: "index_npc_corp_divisions_on_division"
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

  create_table "operation_services", primary_key: ["operation_id", "service_id"], force: :cascade do |t|
    t.integer "operation_id", null: false
    t.integer "service_id", null: false
    t.index ["operation_id"], name: "index_operation_services_on_operation_id"
    t.index ["service_id"], name: "index_operation_services_on_service_id"
  end

  create_table "opportunities", id: false, force: :cascade do |t|
    t.integer "task_id", null: false
    t.bigint "group_id", null: false
    t.string "name"
    t.text "description"
    t.text "notification"
    t.index ["group_id"], name: "index_opportunities_on_group_id"
    t.index ["task_id"], name: "index_opportunities_on_task_id", unique: true
  end

  create_table "opportunity_connections", id: false, force: :cascade do |t|
    t.bigint "group_id", null: false
    t.bigint "connected_group_id", null: false
    t.index ["connected_group_id"], name: "index_opportunity_connections_on_connected_group_id"
    t.index ["group_id", "connected_group_id"], name: "connected_groups_index", unique: true
    t.index ["group_id"], name: "index_opportunity_connections_on_group_id"
  end

  create_table "opportunity_groups", id: false, force: :cascade do |t|
    t.integer "group_id", null: false
    t.string "name"
    t.text "description"
    t.text "notification"
    t.index ["group_id"], name: "index_opportunity_groups_on_group_id", unique: true
  end

  create_table "personal_blueprints", id: false, force: :cascade do |t|
    t.integer "item_id", null: false
    t.bigint "type_id", null: false
    t.bigint "character_id", null: false
    t.integer "material_efficiency", null: false
    t.integer "quantity", null: false
    t.integer "runs", null: false
    t.integer "time_efficiency", null: false
    t.string "location_type"
    t.bigint "location_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["character_id"], name: "index_personal_blueprints_on_character_id"
    t.index ["item_id"], name: "index_personal_blueprints_on_item_id", unique: true
    t.index ["location_type", "location_id"], name: "item_location_index"
    t.index ["type_id"], name: "index_personal_blueprints_on_type_id"
  end

  create_table "personal_research_agents", id: false, force: :cascade do |t|
    t.bigint "character_id", null: false
    t.bigint "agent_id", null: false
    t.bigint "skill_type_id", null: false
    t.float "points_remaining", default: 0.0, null: false
    t.datetime "started", null: false
    t.float "points_per_day", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["agent_id"], name: "index_personal_research_agents_on_agent_id"
    t.index ["character_id", "agent_id"], name: "index_personal_research_agents_on_character_id_and_agent_id"
    t.index ["character_id"], name: "index_personal_research_agents_on_character_id"
    t.index ["skill_type_id"], name: "index_personal_research_agents_on_skill_type_id"
  end

  create_table "pin_schematics", primary_key: ["schematic_id", "pin_type_id"], force: :cascade do |t|
    t.integer "schematic_id", null: false
    t.integer "pin_type_id", null: false
    t.index ["pin_type_id"], name: "index_pin_schematics_on_pin_type_id"
    t.index ["schematic_id"], name: "index_pin_schematics_on_schematic_id"
  end

  create_table "planets", id: false, force: :cascade do |t|
    t.integer "planet_id", null: false
    t.bigint "solar_system_id", null: false
    t.string "name", null: false
    t.bigint "type_id", null: false
    t.float "x"
    t.float "y"
    t.float "z"
    t.index ["planet_id"], name: "index_planets_on_planet_id", unique: true
    t.index ["solar_system_id"], name: "index_planets_on_solar_system_id"
    t.index ["type_id"], name: "index_planets_on_type_id"
  end

  create_table "races", primary_key: "race_id", id: :integer, default: nil, force: :cascade do |t|
    t.string "name", limit: 100
    t.string "description", limit: 1000
    t.integer "icon_id"
    t.string "short_description", limit: 500
    t.bigint "alliance_id"
    t.index ["alliance_id"], name: "index_races_on_alliance_id"
    t.index ["icon_id"], name: "index_races_on_icon_id"
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
    t.text "description"
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
    t.index ["material_id"], name: "index_schematic_materials_on_material_id"
    t.index ["schematic_id"], name: "index_schematic_materials_on_schematic_id"
  end

  create_table "schematics", primary_key: "schematic_id", id: :integer, default: nil, force: :cascade do |t|
    t.string "name", limit: 255
    t.integer "cycle_time"
  end

  create_table "skill_queue_entries", id: false, force: :cascade do |t|
    t.bigint "character_id", null: false
    t.bigint "skill_type_id", null: false
    t.integer "queue_position", null: false
    t.integer "training_start_sp", default: 0, null: false
    t.integer "skill_id"
    t.datetime "start"
    t.datetime "finish"
    t.integer "level_start_sp"
    t.integer "level_end_sp"
    t.integer "finished_level"
    t.index ["character_id"], name: "index_skill_queue_entries_on_character_id"
    t.index ["skill_type_id"], name: "index_skill_queue_entries_on_skill_type_id"
  end

  create_table "skin_licenses", primary_key: "license_type_id", id: :integer, default: nil, force: :cascade do |t|
    t.integer "duration"
    t.integer "skin_id"
    t.index ["skin_id"], name: "index_skin_licenses_on_skin_id"
  end

  create_table "skin_materials", primary_key: "skin_material_id", id: :integer, default: nil, force: :cascade do |t|
    t.integer "display_name_id"
    t.integer "material_set_id"
    t.index ["display_name_id"], name: "index_skin_materials_on_display_name_id"
    t.index ["material_set_id"], name: "index_skin_materials_on_material_set_id"
  end

  create_table "skin_ships", id: false, force: :cascade do |t|
    t.integer "skin_id"
    t.integer "type_id"
    t.index ["skin_id"], name: "ix_skinShip_skinID"
    t.index ["type_id"], name: "ix_skinShip_typeID"
  end

  create_table "skins", primary_key: "skin_id", id: :integer, default: nil, force: :cascade do |t|
    t.string "internal_name", limit: 70
    t.integer "skin_material_id"
    t.index ["skin_material_id"], name: "index_skins_on_skin_material_id"
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
  end

  create_table "sovereignty_campaigns", id: false, force: :cascade do |t|
    t.integer "campaign_id", null: false
    t.bigint "constellation_id", null: false
    t.bigint "solar_system_id", null: false
    t.bigint "sov_structure_id", null: false
    t.integer "event_type", default: 1, null: false
    t.datetime "start_time", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["campaign_id"], name: "index_sovereignty_campaigns_on_campaign_id", unique: true
    t.index ["constellation_id"], name: "index_sovereignty_campaigns_on_constellation_id"
    t.index ["event_type"], name: "index_sovereignty_campaigns_on_event_type"
    t.index ["solar_system_id"], name: "index_sovereignty_campaigns_on_solar_system_id"
    t.index ["sov_structure_id"], name: "index_sovereignty_campaigns_on_sov_structure_id"
  end

  create_table "sovereignty_structures", id: false, force: :cascade do |t|
    t.integer "sov_structure_id", null: false
    t.bigint "alliance_id", null: false
    t.bigint "solar_system_id", null: false
    t.string "capturable_type"
    t.bigint "capturable_id", null: false
    t.float "vulnerability_occupancy_level"
    t.datetime "vulnerable_start_time"
    t.datetime "vulnerable_end_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["alliance_id", "sov_structure_id"], name: "sov_structure_alliance_index"
    t.index ["alliance_id"], name: "index_sovereignty_structures_on_alliance_id"
    t.index ["capturable_type", "capturable_id"], name: "sovereignty_structure_index"
    t.index ["solar_system_id"], name: "index_sovereignty_structures_on_solar_system_id"
    t.index ["sov_structure_id", "solar_system_id"], name: "sov_structure_system_index"
    t.index ["sov_structure_id"], name: "index_sovereignty_structures_on_sov_structure_id", unique: true
  end

  create_table "squads", id: false, force: :cascade do |t|
    t.integer "squad_id", null: false
    t.bigint "fleet_id", null: false
    t.bigint "wing_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["fleet_id"], name: "index_squads_on_fleet_id"
    t.index ["squad_id"], name: "index_squads_on_squad_id", unique: true
    t.index ["wing_id"], name: "index_squads_on_wing_id"
  end

  create_table "standings", id: false, force: :cascade do |t|
    t.string "relationship_type"
    t.bigint "relationship_id", null: false
    t.bigint "character_id", null: false
    t.float "standing", default: 0.0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["character_id"], name: "index_standings_on_character_id"
    t.index ["relationship_type", "relationship_id"], name: "index_standings_on_relationship_type_and_relationship_id"
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
    t.index ["stargate_type_id"], name: "index_stargates_on_stargate_type_id"
  end

  create_table "station_details", primary_key: "station_type_id", id: :integer, default: nil, force: :cascade do |t|
    t.float "dock_entry_x"
    t.float "dock_entry_y"
    t.float "dock_entry_z"
    t.float "dock_orientation_x"
    t.float "dock_orientation_y"
    t.float "dock_orientation_z"
    t.integer "operation_id"
    t.integer "office_slots"
    t.float "reprocessing_efficiency"
    t.boolean "conquerable"
    t.index ["operation_id"], name: "index_station_details_on_operation_id"
  end

  create_table "structure_operations", primary_key: "operation_id", id: :integer, default: nil, force: :cascade do |t|
    t.integer "activity_type"
    t.string "name", limit: 100
    t.string "description", limit: 1000
    t.integer "fringe"
    t.integer "corridor"
    t.integer "hub"
    t.integer "border"
    t.integer "ratio"
    t.integer "caldari_station_type_id"
    t.integer "minmatar_station_type_id"
    t.integer "amarr_station_type_id"
    t.integer "gallente_station_type_id"
    t.integer "jove_station_type_id"
    t.index ["activity_type"], name: "index_structure_operations_on_activity_type"
    t.index ["amarr_station_type_id"], name: "amarr_station_index"
    t.index ["caldari_station_type_id"], name: "caldari_station_index"
    t.index ["gallente_station_type_id"], name: "gallente_station_index"
    t.index ["jove_station_type_id"], name: "jove_station_index"
    t.index ["minmatar_station_type_id"], name: "minmatar_station_index"
  end

  create_table "structure_services", primary_key: "service_id", id: :integer, default: nil, force: :cascade do |t|
    t.string "name", limit: 100
    t.string "description", limit: 1000
  end

  create_table "system_connections", primary_key: ["from_system_id", "to_system_id"], force: :cascade do |t|
    t.integer "from_system_id", null: false
    t.integer "to_system_id", null: false
    t.index ["from_system_id"], name: "index_system_connections_on_from_system_id"
    t.index ["to_system_id"], name: "index_system_connections_on_to_system_id"
  end

  create_table "tower_resources", primary_key: ["tower_type_id", "resource_type_id"], force: :cascade do |t|
    t.integer "tower_type_id", null: false
    t.integer "resource_type_id", null: false
    t.integer "purpose"
    t.integer "quantity"
    t.float "min_security_level"
    t.integer "faction_id"
    t.index ["faction_id"], name: "index_tower_resources_on_faction_id"
    t.index ["resource_type_id"], name: "index_tower_resources_on_resource_type_id"
    t.index ["tower_type_id"], name: "index_tower_resources_on_tower_type_id"
  end

  create_table "training_attributes", primary_key: "attribute_id", id: :integer, default: nil, force: :cascade do |t|
    t.string "name", limit: 100
    t.string "description", limit: 1000
    t.integer "icon_id"
    t.string "short_description", limit: 500
    t.string "notes", limit: 500
    t.index ["icon_id"], name: "index_training_attributes_on_icon_id"
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

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "war_allies", id: false, force: :cascade do |t|
    t.bigint "war_id", null: false
    t.string "ally_type"
    t.bigint "ally_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ally_type", "ally_id"], name: "index_war_allies_on_ally_type_and_ally_id"
    t.index ["war_id"], name: "index_war_allies_on_war_id"
  end

  create_table "wars", id: false, force: :cascade do |t|
    t.integer "war_id", null: false
    t.integer "assistance", default: 0, null: false
    t.boolean "mutual", default: false, null: false
    t.float "aggressor_isk_score", default: 0.0, null: false
    t.float "defender_isk_score", default: 0.0, null: false
    t.integer "aggressor_ship_score", default: 0, null: false
    t.integer "defender_ship_score", default: 0, null: false
    t.datetime "declared", null: false
    t.string "aggressor_type"
    t.bigint "aggressor_id", null: false
    t.string "defender_type"
    t.bigint "defender_id", null: false
    t.datetime "started"
    t.datetime "retracted"
    t.datetime "finished"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["aggressor_type", "aggressor_id"], name: "index_wars_on_aggressor_type_and_aggressor_id"
    t.index ["assistance"], name: "index_wars_on_assistance"
    t.index ["defender_type", "defender_id"], name: "index_wars_on_defender_type_and_defender_id"
    t.index ["war_id"], name: "index_wars_on_war_id", unique: true
  end

  create_table "wings", id: false, force: :cascade do |t|
    t.integer "wing_id", null: false
    t.bigint "fleet_id", null: false
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["fleet_id"], name: "index_wings_on_fleet_id"
    t.index ["wing_id"], name: "index_wings_on_wing_id", unique: true
  end

  create_table "wormhole_system_classes", primary_key: "location_id", id: :integer, default: nil, force: :cascade do |t|
    t.integer "class_id"
    t.string "location_type"
    t.index ["class_id"], name: "index_wormhole_system_classes_on_class_id"
    t.index ["location_type", "location_id"], name: "wormhole_system_class_location_type_and_id"
  end

  add_foreign_key "agents", "corp_division_details", column: "division", primary_key: "division_id"
  add_foreign_key "alliance_histories", "alliances", primary_key: "alliance_id"
  add_foreign_key "alliance_histories", "corporations", primary_key: "corporation_id"
  add_foreign_key "alliances", "corporations", column: "executor_corporation_id", primary_key: "corporation_id"
  add_foreign_key "ancestries", "bloodlines", primary_key: "bloodline_id"
  add_foreign_key "assembly_categories", "assembly_lines", primary_key: "assembly_line_id"
  add_foreign_key "assembly_categories", "item_categories", column: "category_id", primary_key: "category_id"
  add_foreign_key "assembly_groups", "assembly_lines", primary_key: "assembly_line_id"
  add_foreign_key "assembly_groups", "item_groups", column: "group_id", primary_key: "group_id"
  add_foreign_key "assembly_lines", "industry_activities", column: "activity_type", primary_key: "activity_id"
  add_foreign_key "asset_items", "items", column: "type_id", primary_key: "type_id"
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
  add_foreign_key "bookmarks", "bookmarks_folders", column: "folder_id", primary_key: "folder_id"
  add_foreign_key "bookmarks", "characters", column: "creator_id", primary_key: "character_id"
  add_foreign_key "bookmarks", "items", column: "location_type_id", primary_key: "type_id"
  add_foreign_key "bookmarks", "solar_systems", primary_key: "system_id"
  add_foreign_key "campaign_participants", "alliances", primary_key: "alliance_id"
  add_foreign_key "campaign_participants", "sovereignty_campaigns", column: "campaign_id", primary_key: "campaign_id"
  add_foreign_key "celestial_details", "universe_items", column: "celestial_id", primary_key: "item_id"
  add_foreign_key "certificate_masteries", "certificates", column: "cert_id", primary_key: "cert_id"
  add_foreign_key "certificate_masteries", "items", column: "type_id", primary_key: "type_id"
  add_foreign_key "certificate_skills", "certificates", column: "cert_id", primary_key: "cert_id"
  add_foreign_key "certificate_skills", "items", column: "skill_id", primary_key: "type_id"
  add_foreign_key "certificates", "item_groups", column: "group_id", primary_key: "group_id"
  add_foreign_key "channel_allows", "chat_channels", column: "channel_id", primary_key: "channel_id"
  add_foreign_key "channel_blocks", "chat_channels", column: "channel_id", primary_key: "channel_id"
  add_foreign_key "channel_mutes", "chat_channels", column: "channel_id", primary_key: "channel_id"
  add_foreign_key "channel_operators", "chat_channels", column: "channel_id", primary_key: "channel_id"
  add_foreign_key "character_opportunities", "characters", primary_key: "character_id"
  add_foreign_key "character_opportunities", "opportunities", column: "task_id", primary_key: "task_id"
  add_foreign_key "character_skills", "characters", primary_key: "character_id"
  add_foreign_key "character_skills", "items", column: "skill_type_id", primary_key: "type_id"
  add_foreign_key "characters", "alliances", primary_key: "alliance_id"
  add_foreign_key "characters", "ancestries", primary_key: "ancestry_id"
  add_foreign_key "characters", "bloodlines", primary_key: "bloodline_id"
  add_foreign_key "characters", "corporations", primary_key: "corporation_id"
  add_foreign_key "characters", "races", primary_key: "race_id"
  add_foreign_key "chat_channels", "characters", column: "owner_id", primary_key: "character_id"
  add_foreign_key "colonies", "characters", column: "owner_id", primary_key: "character_id"
  add_foreign_key "colonies", "planets", primary_key: "planet_id"
  add_foreign_key "colonies", "solar_systems", primary_key: "system_id"
  add_foreign_key "colony_links", "colony_pins", column: "destination_pin_id", primary_key: "pin_id"
  add_foreign_key "colony_links", "colony_pins", column: "source_pin_id", primary_key: "pin_id"
  add_foreign_key "colony_pins", "colonies"
  add_foreign_key "colony_pins", "items", column: "product_type_id", primary_key: "type_id"
  add_foreign_key "colony_pins", "items", column: "type_id", primary_key: "type_id"
  add_foreign_key "colony_pins", "schematics", primary_key: "schematic_id"
  add_foreign_key "colony_routes", "colony_pins", column: "destination_pin_id", primary_key: "pin_id"
  add_foreign_key "colony_routes", "colony_pins", column: "source_pin_id", primary_key: "pin_id"
  add_foreign_key "colony_waypoints", "colony_pins", column: "pin_id", primary_key: "pin_id"
  add_foreign_key "colony_waypoints", "colony_routes", column: "route_id", primary_key: "route_id"
  add_foreign_key "constellation_connections", "constellations", column: "from_constellation_id", primary_key: "constellation_id"
  add_foreign_key "constellation_connections", "constellations", column: "to_constellation_id", primary_key: "constellation_id"
  add_foreign_key "constellations", "factions", primary_key: "faction_id"
  add_foreign_key "constellations", "regions", primary_key: "region_id"
  add_foreign_key "contact_labels", "characters", primary_key: "character_id"
  add_foreign_key "contacts", "characters", primary_key: "character_id"
  add_foreign_key "contacts", "contact_labels", column: "label_id", primary_key: "label_id"
  add_foreign_key "contraband", "factions", primary_key: "faction_id"
  add_foreign_key "contraband", "items", column: "type_id", primary_key: "type_id"
  add_foreign_key "corporation_histories", "characters", primary_key: "character_id"
  add_foreign_key "corporation_histories", "corporations", primary_key: "corporation_id"
  add_foreign_key "corporations", "alliances", primary_key: "alliance_id"
  add_foreign_key "corporations", "characters", column: "ceo_id", primary_key: "character_id"
  add_foreign_key "corporations", "corporations", column: "enemy_id", primary_key: "corporation_id"
  add_foreign_key "corporations", "corporations", column: "friend_id", primary_key: "corporation_id"
  add_foreign_key "corporations", "icons", primary_key: "icon_id"
  add_foreign_key "corporations", "solar_systems", primary_key: "system_id"
  add_foreign_key "denormalized_map", "constellations", primary_key: "constellation_id"
  add_foreign_key "denormalized_map", "item_groups", column: "group_id", primary_key: "group_id"
  add_foreign_key "denormalized_map", "items", column: "type_id", primary_key: "type_id"
  add_foreign_key "denormalized_map", "regions", primary_key: "region_id"
  add_foreign_key "denormalized_map", "solar_systems", primary_key: "system_id"
  add_foreign_key "denormalized_map", "universe_items", column: "item_id", primary_key: "item_id"
  add_foreign_key "denormalized_map", "universe_items", column: "orbit_id", primary_key: "item_id"
  add_foreign_key "dockable_structures", "constellations", primary_key: "constellation_id"
  add_foreign_key "dockable_structures", "corporations", column: "owner_id", primary_key: "corporation_id"
  add_foreign_key "dockable_structures", "items", column: "station_type_id", primary_key: "type_id"
  add_foreign_key "dockable_structures", "regions", primary_key: "region_id"
  add_foreign_key "dockable_structures", "solar_systems", primary_key: "system_id"
  add_foreign_key "dockable_structures", "structure_operations", column: "operation_id", primary_key: "operation_id"
  add_foreign_key "dogma_attribute_values", "dogma_attributes", column: "attribute_id", primary_key: "attribute_id"
  add_foreign_key "dogma_attribute_values", "items", column: "type_id", primary_key: "type_id"
  add_foreign_key "dogma_attributes", "dogma_attribute_categories", column: "category_id", primary_key: "category_id"
  add_foreign_key "dogma_attributes", "icons", primary_key: "icon_id"
  add_foreign_key "dogma_attributes", "units", primary_key: "unit_id"
  add_foreign_key "dogma_effect_defaults", "dogma_effects", column: "effect_id", primary_key: "effect_id"
  add_foreign_key "dogma_effect_defaults", "items", column: "type_id", primary_key: "type_id"
  add_foreign_key "dogma_effect_modifications", "dogma_attributes", column: "modified_attribute_id", primary_key: "attribute_id"
  add_foreign_key "dogma_effect_modifications", "dogma_attributes", column: "modifying_attribute_id", primary_key: "attribute_id"
  add_foreign_key "dogma_effect_modifications", "dogma_effects", column: "effect_id", primary_key: "effect_id"
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
  add_foreign_key "evemails", "characters", column: "from_id", primary_key: "character_id"
  add_foreign_key "event_responses", "characters", primary_key: "character_id"
  add_foreign_key "event_responses", "events", primary_key: "event_id"
  add_foreign_key "extractor_heads", "colony_pins", column: "pin_id", primary_key: "pin_id"
  add_foreign_key "faction_warfare_systems", "solar_systems", column: "system_id", primary_key: "system_id"
  add_foreign_key "factions", "corporations", column: "militia_corporation_id", primary_key: "corporation_id"
  add_foreign_key "factions", "icons", primary_key: "icon_id"
  add_foreign_key "factions", "races", primary_key: "race_id"
  add_foreign_key "factions", "solar_systems", primary_key: "system_id"
  add_foreign_key "fitting_items", "fittings", primary_key: "fitting_id"
  add_foreign_key "fitting_items", "items", column: "type_id", primary_key: "type_id"
  add_foreign_key "fittings", "characters", column: "creator_id", primary_key: "character_id"
  add_foreign_key "fleet_memberships", "characters", primary_key: "character_id"
  add_foreign_key "fleet_memberships", "fleets", primary_key: "fleet_id"
  add_foreign_key "fleet_memberships", "items", column: "ship_type_id", primary_key: "type_id"
  add_foreign_key "fleet_memberships", "solar_systems", primary_key: "system_id"
  add_foreign_key "fleet_memberships", "wings", primary_key: "wing_id"
  add_foreign_key "incursions", "constellations", primary_key: "constellation_id"
  add_foreign_key "incursions", "factions", primary_key: "faction_id"
  add_foreign_key "incursions", "solar_systems", column: "staging_system_id", primary_key: "system_id"
  add_foreign_key "industry_cost_indices", "solar_systems", column: "system_id", primary_key: "system_id"
  add_foreign_key "industry_facilities", "assembly_lines", primary_key: "assembly_line_id"
  add_foreign_key "industry_facilities", "corporations", column: "owner_id", primary_key: "corporation_id"
  add_foreign_key "industry_facilities", "items", column: "station_type_id", primary_key: "type_id"
  add_foreign_key "industry_facilities", "regions", primary_key: "region_id"
  add_foreign_key "industry_facilities", "solar_systems", primary_key: "system_id"
  add_foreign_key "industry_installations", "assembly_lines", primary_key: "assembly_line_id"
  add_foreign_key "industry_installations", "items", column: "installation_type_id", primary_key: "type_id"
  add_foreign_key "industry_jobs", "characters", column: "completed_character_id", primary_key: "character_id"
  add_foreign_key "industry_jobs", "characters", column: "installer_id", primary_key: "character_id"
  add_foreign_key "industry_jobs", "industry_activities", column: "activity_type", primary_key: "activity_id"
  add_foreign_key "industry_jobs", "items", column: "blueprint_type_id", primary_key: "type_id"
  add_foreign_key "industry_jobs", "items", column: "product_type_id", primary_key: "type_id"
  add_foreign_key "industry_probabilities", "industry_activities", column: "activity_type", primary_key: "activity_id"
  add_foreign_key "industry_reactions", "items", column: "reaction_type_id", primary_key: "type_id"
  add_foreign_key "industry_reactions", "items", column: "reagent_id", primary_key: "type_id"
  add_foreign_key "industry_times", "industry_activities", column: "activity_type", primary_key: "activity_id"
  add_foreign_key "infested_systems", "incursions"
  add_foreign_key "infested_systems", "solar_systems", primary_key: "system_id"
  add_foreign_key "item_categories", "icons", primary_key: "icon_id"
  add_foreign_key "item_groups", "icons", primary_key: "icon_id"
  add_foreign_key "item_groups", "item_categories", column: "category_id", primary_key: "category_id"
  add_foreign_key "item_materials", "items", column: "material_type_id", primary_key: "type_id"
  add_foreign_key "item_volumes", "items", column: "type_id", primary_key: "type_id"
  add_foreign_key "items", "graphics", primary_key: "graphic_id"
  add_foreign_key "items", "icons", primary_key: "icon_id"
  add_foreign_key "items", "item_groups", column: "group_id", primary_key: "group_id"
  add_foreign_key "items", "races", primary_key: "race_id"
  add_foreign_key "killmail_attackers", "alliances", column: "attacker_alliance_id", primary_key: "alliance_id"
  add_foreign_key "killmail_attackers", "characters", column: "attacker_id", primary_key: "character_id"
  add_foreign_key "killmail_attackers", "corporations", column: "attacker_corporation_id", primary_key: "corporation_id"
  add_foreign_key "killmail_attackers", "factions", column: "attacker_faction_id", primary_key: "faction_id"
  add_foreign_key "killmail_attackers", "items", column: "ship_type_id", primary_key: "type_id"
  add_foreign_key "killmail_attackers", "items", column: "weapon_type_id", primary_key: "type_id"
  add_foreign_key "killmail_attackers", "killmails", primary_key: "killmail_id"
  add_foreign_key "killmail_items", "items", column: "type_id", primary_key: "type_id"
  add_foreign_key "killmail_items", "killmail_items"
  add_foreign_key "killmail_items", "killmails", primary_key: "killmail_id"
  add_foreign_key "killmails", "alliances", column: "victim_alliance_id", primary_key: "alliance_id"
  add_foreign_key "killmails", "characters", column: "victim_id", primary_key: "character_id"
  add_foreign_key "killmails", "corporations", column: "victim_corporation_id", primary_key: "corporation_id"
  add_foreign_key "killmails", "factions", column: "victim_faction_id", primary_key: "faction_id"
  add_foreign_key "killmails", "items", column: "victim_ship_type_id", primary_key: "type_id"
  add_foreign_key "killmails", "solar_systems", primary_key: "system_id"
  add_foreign_key "landmarks", "icons", primary_key: "icon_id"
  add_foreign_key "landmarks", "solar_systems", primary_key: "system_id"
  add_foreign_key "mail_label_assignments", "evemails", primary_key: "mail_id"
  add_foreign_key "mail_label_assignments", "mail_labels", column: "label_id", primary_key: "label_id"
  add_foreign_key "mail_labels", "characters", primary_key: "character_id"
  add_foreign_key "mail_recipients", "characters", column: "recipient_id", primary_key: "character_id"
  add_foreign_key "mail_recipients", "evemails", primary_key: "mail_id"
  add_foreign_key "mailing_list_subscriptions", "characters", column: "subscriber_id", primary_key: "character_id"
  add_foreign_key "mailing_list_subscriptions", "mailing_lists", primary_key: "mailing_list_id"
  add_foreign_key "mailing_lists", "characters", column: "creator_id", primary_key: "character_id"
  add_foreign_key "market_groups", "icons", primary_key: "icon_id"
  add_foreign_key "market_groups", "market_groups", column: "parent_group_id", primary_key: "market_group_id"
  add_foreign_key "medal_awards", "characters", column: "issuer_id", primary_key: "character_id"
  add_foreign_key "medal_awards", "characters", primary_key: "character_id"
  add_foreign_key "medal_awards", "medals", primary_key: "medal_id"
  add_foreign_key "medals", "corporations", primary_key: "corporation_id"
  add_foreign_key "meta_item_groups", "icons", primary_key: "icon_id"
  add_foreign_key "meta_variations", "items", column: "base_type_id", primary_key: "type_id"
  add_foreign_key "meta_variations", "items", column: "meta_type_id", primary_key: "type_id"
  add_foreign_key "meta_variations", "meta_item_groups", column: "meta_group_id", primary_key: "meta_group_id"
  add_foreign_key "moons", "planets", primary_key: "planet_id"
  add_foreign_key "moons", "solar_systems", primary_key: "system_id"
  add_foreign_key "npc_corp_divisions", "corp_division_details", column: "division", primary_key: "division_id"
  add_foreign_key "npc_corp_divisions", "corporations", primary_key: "corporation_id"
  add_foreign_key "npc_corp_item_offers", "corporations", primary_key: "corporation_id"
  add_foreign_key "npc_corp_item_offers", "items", column: "type_id", primary_key: "type_id"
  add_foreign_key "npc_corp_research", "corporations", primary_key: "corporation_id"
  add_foreign_key "npc_corp_research", "items", column: "skill_type_id", primary_key: "type_id"
  add_foreign_key "operation_services", "structure_operations", column: "operation_id", primary_key: "operation_id"
  add_foreign_key "operation_services", "structure_services", column: "service_id", primary_key: "service_id"
  add_foreign_key "opportunities", "opportunity_groups", column: "group_id", primary_key: "group_id"
  add_foreign_key "opportunity_connections", "opportunity_groups", column: "connected_group_id", primary_key: "group_id"
  add_foreign_key "opportunity_connections", "opportunity_groups", column: "group_id", primary_key: "group_id"
  add_foreign_key "personal_blueprints", "characters", primary_key: "character_id"
  add_foreign_key "personal_blueprints", "items", column: "type_id", primary_key: "type_id"
  add_foreign_key "personal_research_agents", "agents", primary_key: "agent_id"
  add_foreign_key "personal_research_agents", "characters", primary_key: "character_id"
  add_foreign_key "personal_research_agents", "items", column: "skill_type_id", primary_key: "type_id"
  add_foreign_key "pin_schematics", "items", column: "pin_type_id", primary_key: "type_id"
  add_foreign_key "pin_schematics", "schematics", primary_key: "schematic_id"
  add_foreign_key "planets", "items", column: "type_id", primary_key: "type_id"
  add_foreign_key "planets", "solar_systems", primary_key: "system_id"
  add_foreign_key "races", "alliances", primary_key: "alliance_id"
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
  add_foreign_key "skill_queue_entries", "characters", primary_key: "character_id"
  add_foreign_key "skill_queue_entries", "items", column: "skill_type_id", primary_key: "type_id"
  add_foreign_key "skin_licenses", "items", column: "license_type_id", primary_key: "type_id"
  add_foreign_key "skin_licenses", "skins", primary_key: "skin_id"
  add_foreign_key "skin_ships", "items", column: "type_id", primary_key: "type_id"
  add_foreign_key "skin_ships", "skins", primary_key: "skin_id"
  add_foreign_key "skins", "skin_materials", primary_key: "skin_material_id"
  add_foreign_key "solar_systems", "constellations", primary_key: "constellation_id"
  add_foreign_key "solar_systems", "factions", primary_key: "faction_id"
  add_foreign_key "solar_systems", "items", column: "sun_type_id", primary_key: "type_id"
  add_foreign_key "solar_systems", "regions", primary_key: "region_id"
  add_foreign_key "sovereignty_campaigns", "constellations", primary_key: "constellation_id"
  add_foreign_key "sovereignty_campaigns", "solar_systems", primary_key: "system_id"
  add_foreign_key "sovereignty_campaigns", "sovereignty_structures", column: "sov_structure_id", primary_key: "sov_structure_id"
  add_foreign_key "sovereignty_structures", "alliances", primary_key: "alliance_id"
  add_foreign_key "sovereignty_structures", "solar_systems", primary_key: "system_id"
  add_foreign_key "squads", "fleets", primary_key: "fleet_id"
  add_foreign_key "squads", "wings", primary_key: "wing_id"
  add_foreign_key "standings", "characters", primary_key: "character_id"
  add_foreign_key "stargates", "items", column: "stargate_type_id", primary_key: "type_id"
  add_foreign_key "stargates", "solar_systems", column: "destination_system_id", primary_key: "system_id"
  add_foreign_key "stargates", "solar_systems", primary_key: "system_id"
  add_foreign_key "stargates", "stargates", column: "destination_stargate_id", primary_key: "stargate_id"
  add_foreign_key "station_details", "items", column: "station_type_id", primary_key: "type_id"
  add_foreign_key "station_details", "structure_operations", column: "operation_id", primary_key: "operation_id"
  add_foreign_key "structure_operations", "items", column: "amarr_station_type_id", primary_key: "type_id"
  add_foreign_key "structure_operations", "items", column: "caldari_station_type_id", primary_key: "type_id"
  add_foreign_key "structure_operations", "items", column: "gallente_station_type_id", primary_key: "type_id"
  add_foreign_key "structure_operations", "items", column: "jove_station_type_id", primary_key: "type_id"
  add_foreign_key "structure_operations", "items", column: "minmatar_station_type_id", primary_key: "type_id"
  add_foreign_key "system_connections", "solar_systems", column: "from_system_id", primary_key: "system_id"
  add_foreign_key "system_connections", "solar_systems", column: "to_system_id", primary_key: "system_id"
  add_foreign_key "tower_resources", "factions", primary_key: "faction_id"
  add_foreign_key "tower_resources", "items", column: "resource_type_id", primary_key: "type_id"
  add_foreign_key "tower_resources", "items", column: "tower_type_id", primary_key: "type_id"
  add_foreign_key "training_attributes", "icons", primary_key: "icon_id"
  add_foreign_key "universe_entities", "universe_items", column: "item_id", primary_key: "item_id"
  add_foreign_key "universe_items", "inventory_flags", column: "flag_id", primary_key: "flag_id"
  add_foreign_key "universe_positions", "universe_items", column: "item_id", primary_key: "item_id"
  add_foreign_key "universe_unique_names", "item_groups", column: "group_id", primary_key: "group_id"
  add_foreign_key "universe_unique_names", "universe_items", column: "item_id", primary_key: "item_id"
  add_foreign_key "war_allies", "wars", primary_key: "war_id"
  add_foreign_key "wings", "fleets", primary_key: "fleet_id"
end
