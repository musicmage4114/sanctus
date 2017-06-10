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

ActiveRecord::Schema.define(version: 20170609062546) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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

  create_table "assets", id: false, force: :cascade do |t|
    t.integer "item_id", null: false
    t.integer "singleton", default: 1, null: false
    t.string "location_flag", null: false
    t.string "location_type"
    t.bigint "location_id", null: false
    t.string "ownable_type"
    t.bigint "ownable_id", null: false
    t.string "owner_type"
    t.bigint "owner_id", null: false
    t.integer "quantity"
    t.index ["item_id"], name: "index_assets_on_item_id", unique: true
    t.index ["location_type", "location_id"], name: "index_assets_on_location_type_and_location_id"
    t.index ["ownable_type", "ownable_id"], name: "index_assets_on_ownable_type_and_ownable_id"
    t.index ["owner_type", "owner_id"], name: "index_assets_on_owner_type_and_owner_id"
    t.index ["singleton"], name: "index_assets_on_singleton"
  end

  create_table "bloodlines", id: false, force: :cascade do |t|
    t.integer "bloodline_id", null: false
    t.bigint "race_id", null: false
    t.bigint "corporation_id"
    t.bigint "ship_type_id"
    t.string "name"
    t.text "description"
    t.integer "charisma"
    t.integer "intelligence"
    t.integer "memory"
    t.integer "perception"
    t.integer "willpower"
    t.index ["bloodline_id"], name: "index_bloodlines_on_bloodline_id", unique: true
    t.index ["corporation_id"], name: "index_bloodlines_on_corporation_id"
    t.index ["race_id"], name: "index_bloodlines_on_race_id"
    t.index ["ship_type_id"], name: "index_bloodlines_on_ship_type_id"
  end

  create_table "blueprints", id: false, force: :cascade do |t|
    t.integer "type_id", null: false
    t.bigint "group_id", null: false
    t.string "name", null: false
    t.integer "data_export", default: 1, null: false
    t.bigint "graphic_id"
    t.bigint "market_group_id"
    t.string "produceable_type"
    t.bigint "produceable_id", null: false
    t.text "description"
    t.float "volume"
    t.index ["data_export"], name: "index_blueprints_on_data_export"
    t.index ["graphic_id"], name: "index_blueprints_on_graphic_id"
    t.index ["group_id"], name: "index_blueprints_on_group_id"
    t.index ["market_group_id"], name: "index_blueprints_on_market_group_id"
    t.index ["produceable_type", "produceable_id"], name: "index_blueprints_on_produceable_type_and_produceable_id"
    t.index ["type_id"], name: "index_blueprints_on_type_id", unique: true
  end

  create_table "bookmarks", id: false, force: :cascade do |t|
    t.integer "bookmark_id", null: false
    t.bigint "creator_id", null: false
    t.bigint "solar_system_id", null: false
    t.datetime "create_date", null: false
    t.bigint "folder_id"
    t.bigint "type_id"
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
    t.index ["owner_type", "owner_id"], name: "index_bookmarks_on_owner_type_and_owner_id"
    t.index ["solar_system_id"], name: "index_bookmarks_on_solar_system_id"
    t.index ["type_id"], name: "index_bookmarks_on_type_id"
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

  create_table "constellations", id: false, force: :cascade do |t|
    t.integer "constellation_id", null: false
    t.bigint "region_id", null: false
    t.string "name", null: false
    t.float "x"
    t.float "y"
    t.float "z"
    t.index ["constellation_id"], name: "index_constellations_on_constellation_id", unique: true
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

  create_table "corporation_histories", id: false, force: :cascade do |t|
    t.bigint "character_id", null: false
    t.bigint "corporation_id", null: false
    t.integer "record_id", null: false
    t.datetime "start_date", null: false
    t.index ["character_id", "corporation_id"], name: "index_corporation_histories_on_character_id_and_corporation_id"
    t.index ["character_id"], name: "index_corporation_histories_on_character_id"
    t.index ["corporation_id"], name: "index_corporation_histories_on_corporation_id"
  end

  create_table "corporations", id: false, force: :cascade do |t|
    t.integer "corporation_id", null: false
    t.bigint "ceo_id", null: false
    t.decimal "tax_rate", precision: 4, scale: 3, null: false
    t.string "ticker", limit: 5, null: false
    t.string "name", null: false
    t.bigint "creator_id", null: false
    t.bigint "alliance_id"
    t.bigint "faction_id"
    t.datetime "creation_date"
    t.integer "member_count"
    t.string "url"
    t.text "description"
    t.string "faction_name"
    t.integer "deletion_status"
    t.string "icon_64"
    t.string "icon_128"
    t.string "icon_256"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["alliance_id"], name: "index_corporations_on_alliance_id"
    t.index ["ceo_id"], name: "index_corporations_on_ceo_id", unique: true
    t.index ["corporation_id"], name: "index_corporations_on_corporation_id", unique: true
    t.index ["creator_id"], name: "index_corporations_on_creator_id"
    t.index ["faction_id"], name: "index_corporations_on_faction_id"
  end

  create_table "dogma_attribute_values", id: false, force: :cascade do |t|
    t.bigint "attribute_id", null: false
    t.string "entity_type"
    t.bigint "entity_id", null: false
    t.decimal "value", null: false
    t.index ["attribute_id"], name: "index_dogma_attribute_values_on_attribute_id"
    t.index ["entity_type", "entity_id"], name: "index_dogma_attribute_values_on_entity_type_and_entity_id"
  end

  create_table "dogma_attributes", id: false, force: :cascade do |t|
    t.integer "attribute_id", null: false
    t.integer "data_export", default: 1, null: false
    t.integer "unit_id"
    t.integer "good"
    t.integer "stacking"
    t.bigint "icon_id"
    t.float "default_value"
    t.text "description"
    t.string "display_name"
    t.string "name"
    t.index ["attribute_id"], name: "index_dogma_attributes_on_attribute_id", unique: true
    t.index ["data_export"], name: "index_dogma_attributes_on_data_export"
    t.index ["good"], name: "index_dogma_attributes_on_good"
    t.index ["icon_id"], name: "index_dogma_attributes_on_icon_id"
    t.index ["stacking"], name: "index_dogma_attributes_on_stacking"
    t.index ["unit_id"], name: "index_dogma_attributes_on_unit_id"
  end

  create_table "dogma_effect_defaults", id: false, force: :cascade do |t|
    t.bigint "dogma_effect_id", null: false
    t.string "entity_type"
    t.bigint "entity_id", null: false
    t.boolean "default", default: true, null: false
    t.index ["dogma_effect_id"], name: "index_dogma_effect_defaults_on_dogma_effect_id"
    t.index ["entity_type", "entity_id"], name: "dogma_effect_default_index"
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

  create_table "dogma_effects", id: false, force: :cascade do |t|
    t.integer "effect_id", null: false
    t.integer "auto_repeat", default: 1, null: false
    t.integer "data_export", default: 0, null: false
    t.integer "attribute_type", default: 6, null: false
    t.boolean "assistance", default: false, null: false
    t.boolean "offensive", default: false, null: false
    t.boolean "warp_safe", default: false, null: false
    t.boolean "range_chance", default: false, null: false
    t.boolean "electronic_chance", default: false, null: false
    t.bigint "attribute_id"
    t.bigint "icon_id"
    t.string "name"
    t.string "display_name"
    t.text "description"
    t.integer "effect_category"
    t.integer "pre_expression"
    t.integer "post_expression"
    t.index ["attribute_id"], name: "index_dogma_effects_on_attribute_id"
    t.index ["attribute_type"], name: "index_dogma_effects_on_attribute_type"
    t.index ["auto_repeat"], name: "index_dogma_effects_on_auto_repeat"
    t.index ["data_export"], name: "index_dogma_effects_on_data_export"
    t.index ["effect_id"], name: "index_dogma_effects_on_effect_id", unique: true
    t.index ["icon_id"], name: "index_dogma_effects_on_icon_id"
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

  create_table "extra_cargoholds", id: false, force: :cascade do |t|
    t.bigint "ship_id", null: false
    t.integer "hold_type", default: 0, null: false
    t.float "capacity"
    t.index ["hold_type"], name: "index_extra_cargoholds_on_hold_type"
    t.index ["ship_id"], name: "index_extra_cargoholds_on_ship_id"
  end

  create_table "extractor_heads", id: false, force: :cascade do |t|
    t.integer "head_id", null: false
    t.bigint "pin_id", null: false
    t.float "latitude"
    t.float "longitude"
    t.index ["head_id"], name: "index_extractor_heads_on_head_id", unique: true
    t.index ["pin_id"], name: "index_extractor_heads_on_pin_id"
  end

  create_table "factions", id: false, force: :cascade do |t|
    t.integer "faction_id", null: false
    t.integer "uniqueness", default: 1, null: false
    t.bigint "corporation_id", null: false
    t.string "name", null: false
    t.bigint "solar_system_id"
    t.text "description"
    t.integer "size_factor"
    t.integer "station_count"
    t.integer "station_system_count"
    t.index ["corporation_id"], name: "index_factions_on_corporation_id"
    t.index ["faction_id"], name: "index_factions_on_faction_id", unique: true
    t.index ["solar_system_id"], name: "index_factions_on_solar_system_id"
    t.index ["uniqueness"], name: "index_factions_on_uniqueness"
  end

  create_table "fitting_items", id: false, force: :cascade do |t|
    t.bigint "fitting_id", null: false
    t.string "fitted_item_type"
    t.bigint "fitted_item_id", null: false
    t.integer "flag"
    t.integer "quantity"
    t.index ["fitted_item_type", "fitted_item_id"], name: "index_fitting_items_on_fitted_item_type_and_fitted_item_id"
    t.index ["fitting_id"], name: "index_fitting_items_on_fitting_id"
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

  create_table "industry_jobs", id: false, force: :cascade do |t|
    t.integer "job_id", null: false
    t.bigint "activity_id", null: false
    t.integer "blueprint_id", null: false
    t.bigint "blueprint_type_id", null: false
    t.bigint "facility_id", null: false
    t.bigint "installer_id", null: false
    t.bigint "completed_character_id"
    t.string "product_type"
    t.bigint "product_id"
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
    t.index ["activity_id"], name: "index_industry_jobs_on_activity_id"
    t.index ["blueprint_id"], name: "index_industry_jobs_on_blueprint_id"
    t.index ["blueprint_type_id"], name: "index_industry_jobs_on_blueprint_type_id"
    t.index ["completed_character_id"], name: "index_industry_jobs_on_completed_character_id"
    t.index ["facility_id"], name: "index_industry_jobs_on_facility_id"
    t.index ["installer_id"], name: "index_industry_jobs_on_installer_id"
    t.index ["job_blueprint_location_type", "job_blueprint_location_id"], name: "job_blueprint_location_index"
    t.index ["job_id"], name: "index_industry_jobs_on_job_id", unique: true
    t.index ["job_location_type", "job_location_id"], name: "job_location_index"
    t.index ["output_location_type", "output_location_id"], name: "output_location_index"
    t.index ["product_type", "product_id"], name: "index_industry_jobs_on_product_type_and_product_id"
  end

  create_table "infested_systems", id: false, force: :cascade do |t|
    t.bigint "incursion_id", null: false
    t.bigint "solar_system_id", null: false
    t.integer "type", default: 2, null: false
    t.index ["incursion_id"], name: "index_infested_systems_on_incursion_id"
    t.index ["solar_system_id"], name: "index_infested_systems_on_solar_system_id"
    t.index ["type"], name: "index_infested_systems_on_type"
  end

  create_table "item_categories", id: false, force: :cascade do |t|
    t.integer "category_id", null: false
    t.integer "data_export", default: 1, null: false
    t.string "name", null: false
    t.index ["category_id"], name: "index_item_categories_on_category_id", unique: true
    t.index ["data_export"], name: "index_item_categories_on_data_export"
  end

  create_table "item_groups", id: false, force: :cascade do |t|
    t.integer "group_id", null: false
    t.integer "data_export", default: 1, null: false
    t.bigint "category_id", null: false
    t.string "group_type", null: false
    t.string "name", null: false
    t.index ["category_id"], name: "index_item_groups_on_category_id"
    t.index ["data_export"], name: "index_item_groups_on_data_export"
    t.index ["group_id"], name: "index_item_groups_on_group_id", unique: true
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
    t.index ["attacker_id", "killmail_id"], name: "index_killmail_attackers_on_attacker_id_and_killmail_id"
    t.index ["attacker_type", "attacker_id"], name: "killmail_attackers-index"
    t.index ["killmail_id"], name: "index_killmail_attackers_on_killmail_id"
    t.index ["ship_type_id"], name: "index_killmail_attackers_on_ship_type_id"
    t.index ["weapon_type_id"], name: "index_killmail_attackers_on_weapon_type_id"
  end

  create_table "killmail_items", force: :cascade do |t|
    t.bigint "killmail_id", null: false
    t.integer "stack", default: 1, null: false
    t.bigint "killmail_item_id"
    t.string "killmail_loot_type"
    t.bigint "killmail_loot_id", null: false
    t.integer "flag"
    t.integer "quantity_destroyed"
    t.integer "quantity_dropped"
    t.float "total_value"
    t.float "dropped_value"
    t.float "destroyed_value"
    t.index ["killmail_id"], name: "index_killmail_items_on_killmail_id"
    t.index ["killmail_item_id"], name: "index_killmail_items_on_killmail_item_id"
    t.index ["killmail_loot_type", "killmail_loot_id"], name: "killmail_loot_index"
    t.index ["stack"], name: "index_killmail_items_on_stack"
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
    t.text "description"
    t.string "graphic", null: false
    t.integer "layer", null: false
    t.integer "part", null: false
    t.integer "color"
    t.index ["corporation_id"], name: "index_medals_on_corporation_id"
    t.index ["medal_id"], name: "index_medals_on_medal_id", unique: true
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
    t.index ["character_id", "type_id"], name: "index_personal_blueprints_on_character_id_and_type_id"
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

  create_table "planets", id: false, force: :cascade do |t|
    t.integer "planet_id", null: false
    t.bigint "solar_system_id", null: false
    t.string "name", null: false
    t.integer "type", null: false
    t.integer "asteroid_belts"
    t.integer "ice_belts"
    t.integer "data_export", default: 1, null: false
    t.bigint "group_id", null: false
    t.integer "type_id", null: false
    t.text "description"
    t.integer "icon_id"
    t.integer "graphic_id"
    t.float "x"
    t.float "y"
    t.float "z"
    t.index ["data_export"], name: "index_planets_on_data_export"
    t.index ["group_id"], name: "index_planets_on_group_id"
    t.index ["planet_id"], name: "index_planets_on_planet_id", unique: true
    t.index ["solar_system_id"], name: "index_planets_on_solar_system_id"
  end

  create_table "races", id: false, force: :cascade do |t|
    t.integer "race_id", null: false
    t.bigint "alliance_id", null: false
    t.string "name", null: false
    t.text "description"
    t.index ["alliance_id"], name: "index_races_on_alliance_id"
    t.index ["race_id"], name: "index_races_on_race_id", unique: true
  end

  create_table "regions", id: false, force: :cascade do |t|
    t.integer "region_id", null: false
    t.string "name", null: false
    t.text "description"
    t.index ["region_id"], name: "index_regions_on_region_id", unique: true
  end

  create_table "required_skills", id: false, force: :cascade do |t|
    t.bigint "skill_type_id", null: false
    t.string "usable_type"
    t.bigint "usable_id", null: false
    t.integer "required_level", null: false
    t.index ["skill_type_id"], name: "index_required_skills_on_skill_type_id"
    t.index ["usable_type", "usable_id"], name: "index_required_skills_on_usable_type_and_usable_id"
  end

  create_table "schematics", id: false, force: :cascade do |t|
    t.integer "schematic_id", null: false
    t.string "name", null: false
    t.integer "cycle_time", null: false
    t.index ["schematic_id"], name: "index_schematics_on_schematic_id", unique: true
  end

  create_table "ships", id: false, force: :cascade do |t|
    t.integer "type_id", null: false
    t.integer "data_export", default: 1, null: false
    t.integer "tech_level", default: 1, null: false
    t.bigint "group_id", null: false
    t.bigint "graphic_id", null: false
    t.bigint "faction_id", null: false
    t.integer "high_slots", default: 0, null: false
    t.integer "mid_slots", default: 0, null: false
    t.integer "low_slots", default: 0, null: false
    t.integer "rigs", default: 3, null: false
    t.integer "calibration", default: 400, null: false
    t.integer "drone_capacity", default: 0, null: false
    t.integer "bandwidth", default: 0, null: false
    t.integer "max_targets", default: 1, null: false
    t.float "em_structure_resist", default: 0.0, null: false
    t.float "exp_structure_resist", default: 0.0, null: false
    t.float "kin_structure_resist", default: 0.0, null: false
    t.float "therm_structure_resist", default: 0.0, null: false
    t.float "em_armor_resist", default: 0.0, null: false
    t.float "exp_armor_resist", default: 0.0, null: false
    t.float "kin_armor_resist", default: 0.0, null: false
    t.float "therm_armor_resist", default: 0.0, null: false
    t.float "em_shield_resist", default: 0.0, null: false
    t.float "exp_shield_resist", default: 0.0, null: false
    t.float "kin_shield_resist", default: 0.0, null: false
    t.float "therm_shield_resist", default: 0.0, null: false
    t.float "radar_strength", default: 0.0, null: false
    t.float "ladar_strength", default: 0.0, null: false
    t.float "gravimetric_strength", default: 0.0, null: false
    t.float "magnetometric_strength", default: 0.0, null: false
    t.integer "launcher_hardpoints", default: 0, null: false
    t.integer "turret_hardpoints", default: 0, null: false
    t.string "name", null: false
    t.text "description"
    t.string "hull_class"
    t.string "size_class"
    t.string "ship_type"
    t.integer "radius"
    t.integer "volume"
    t.float "capacity"
    t.integer "mass"
    t.float "powergrid"
    t.float "cpu"
    t.float "capacitor"
    t.float "max_target_range"
    t.float "max_velocity"
    t.float "inertia_modifier"
    t.float "base_warp_time"
    t.float "warp_speed"
    t.integer "structure_hp"
    t.integer "armor_hp"
    t.integer "shield_hp"
    t.integer "shield_recharge"
    t.float "signature_radius"
    t.integer "scan_resolution"
    t.index ["data_export"], name: "index_ships_on_data_export"
    t.index ["faction_id"], name: "index_ships_on_faction_id"
    t.index ["graphic_id"], name: "index_ships_on_graphic_id"
    t.index ["group_id"], name: "index_ships_on_group_id"
    t.index ["tech_level"], name: "index_ships_on_tech_level"
    t.index ["type_id"], name: "index_ships_on_type_id", unique: true
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

  create_table "skills", id: false, force: :cascade do |t|
    t.integer "type_id", null: false
    t.integer "data_export", default: 1, null: false
    t.bigint "group_id", null: false
    t.string "name", null: false
    t.text "description", null: false
    t.integer "skill_id"
    t.index ["data_export"], name: "index_skills_on_data_export"
    t.index ["group_id"], name: "index_skills_on_group_id"
    t.index ["type_id"], name: "index_skills_on_type_id", unique: true
  end

  create_table "solar_systems", id: false, force: :cascade do |t|
    t.integer "system_id", null: false
    t.bigint "constellation_id", null: false
    t.string "name", null: false
    t.float "security_status", null: false
    t.string "security_class"
    t.integer "asteroid_belts"
    t.integer "ice_belts"
    t.integer "jumps_last_hour"
    t.datetime "last_jumps_check"
    t.integer "npc_kills_last_hour"
    t.integer "pod_kills_last_hour"
    t.integer "ship_kills_last_hour"
    t.datetime "last_kills_check"
    t.bigint "faction_id"
    t.bigint "corporation_id"
    t.bigint "alliance_id"
    t.float "x"
    t.float "y"
    t.float "z"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["alliance_id"], name: "index_solar_systems_on_alliance_id"
    t.index ["constellation_id"], name: "index_solar_systems_on_constellation_id"
    t.index ["corporation_id"], name: "index_solar_systems_on_corporation_id"
    t.index ["faction_id"], name: "index_solar_systems_on_faction_id"
    t.index ["system_id"], name: "index_solar_systems_on_system_id", unique: true
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

  create_table "stargates", id: false, force: :cascade do |t|
    t.integer "stargate_id", null: false
    t.bigint "solar_system_id", null: false
    t.bigint "destination_id", null: false
    t.bigint "destination_stargate_id", null: false
    t.string "name"
    t.integer "data_export", default: 1, null: false
    t.bigint "group_id", null: false
    t.bigint "graphic_id"
    t.integer "type_id"
    t.string "type"
    t.float "x"
    t.float "y"
    t.float "z"
    t.index ["data_export"], name: "index_stargates_on_data_export"
    t.index ["destination_id"], name: "index_stargates_on_destination_id"
    t.index ["destination_stargate_id"], name: "index_stargates_on_destination_stargate_id"
    t.index ["graphic_id"], name: "index_stargates_on_graphic_id"
    t.index ["group_id"], name: "index_stargates_on_group_id"
    t.index ["solar_system_id"], name: "index_stargates_on_solar_system_id"
    t.index ["stargate_id"], name: "index_stargates_on_stargate_id", unique: true
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
    t.string "aggressor_type"
    t.bigint "aggressor_id", null: false
    t.string "defender_type"
    t.bigint "defender_id", null: false
    t.integer "assistance", default: 0, null: false
    t.boolean "mutual", default: false, null: false
    t.float "aggressor_isk_score", default: 0.0, null: false
    t.float "defender_isk_score", default: 0.0, null: false
    t.integer "aggressor_ship_score", default: 0, null: false
    t.integer "defender_ship_score", default: 0, null: false
    t.datetime "declared", null: false
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

  add_foreign_key "alliance_histories", "alliances", primary_key: "alliance_id"
  add_foreign_key "alliance_histories", "corporations", primary_key: "corporation_id"
  add_foreign_key "alliances", "corporations", column: "executor_corporation_id", primary_key: "corporation_id"
  add_foreign_key "bloodlines", "corporations", primary_key: "corporation_id"
  add_foreign_key "bloodlines", "races", primary_key: "race_id"
  add_foreign_key "bookmarks", "bookmarks_folders", column: "folder_id", primary_key: "folder_id"
  add_foreign_key "bookmarks", "characters", column: "creator_id", primary_key: "character_id"
  add_foreign_key "bookmarks", "solar_systems", primary_key: "system_id"
  add_foreign_key "campaign_participants", "alliances", primary_key: "alliance_id"
  add_foreign_key "campaign_participants", "sovereignty_campaigns", column: "campaign_id", primary_key: "campaign_id"
  add_foreign_key "channel_allows", "chat_channels", column: "channel_id", primary_key: "channel_id"
  add_foreign_key "channel_blocks", "chat_channels", column: "channel_id", primary_key: "channel_id"
  add_foreign_key "channel_mutes", "chat_channels", column: "channel_id", primary_key: "channel_id"
  add_foreign_key "channel_operators", "chat_channels", column: "channel_id", primary_key: "channel_id"
  add_foreign_key "character_opportunities", "characters", primary_key: "character_id"
  add_foreign_key "character_opportunities", "opportunities", column: "task_id", primary_key: "task_id"
  add_foreign_key "character_skills", "characters", primary_key: "character_id"
  add_foreign_key "character_skills", "skills", column: "skill_type_id", primary_key: "type_id"
  add_foreign_key "characters", "alliances", primary_key: "alliance_id"
  add_foreign_key "characters", "corporations", primary_key: "corporation_id"
  add_foreign_key "chat_channels", "characters", column: "owner_id", primary_key: "character_id"
  add_foreign_key "colonies", "characters", column: "owner_id", primary_key: "character_id"
  add_foreign_key "colonies", "planets", primary_key: "planet_id"
  add_foreign_key "colonies", "solar_systems", primary_key: "system_id"
  add_foreign_key "colony_links", "colony_pins", column: "destination_pin_id", primary_key: "pin_id"
  add_foreign_key "colony_links", "colony_pins", column: "source_pin_id", primary_key: "pin_id"
  add_foreign_key "colony_pins", "colonies"
  add_foreign_key "colony_pins", "schematics", primary_key: "schematic_id"
  add_foreign_key "colony_routes", "colony_pins", column: "destination_pin_id", primary_key: "pin_id"
  add_foreign_key "colony_routes", "colony_pins", column: "source_pin_id", primary_key: "pin_id"
  add_foreign_key "colony_waypoints", "colony_pins", column: "pin_id", primary_key: "pin_id"
  add_foreign_key "colony_waypoints", "colony_routes", column: "route_id", primary_key: "route_id"
  add_foreign_key "constellations", "regions", primary_key: "region_id"
  add_foreign_key "contact_labels", "characters", primary_key: "character_id"
  add_foreign_key "contacts", "characters", primary_key: "character_id"
  add_foreign_key "contacts", "contact_labels", column: "label_id", primary_key: "label_id"
  add_foreign_key "corporation_histories", "characters", primary_key: "character_id"
  add_foreign_key "corporation_histories", "corporations", primary_key: "corporation_id"
  add_foreign_key "corporations", "alliances", primary_key: "alliance_id"
  add_foreign_key "corporations", "characters", column: "ceo_id", primary_key: "character_id"
  add_foreign_key "corporations", "factions", primary_key: "faction_id"
  add_foreign_key "dogma_attribute_values", "dogma_attributes", column: "attribute_id", primary_key: "attribute_id"
  add_foreign_key "dogma_effect_defaults", "dogma_effects", primary_key: "effect_id"
  add_foreign_key "dogma_effect_modifications", "dogma_attributes", column: "modified_attribute_id", primary_key: "attribute_id"
  add_foreign_key "dogma_effect_modifications", "dogma_attributes", column: "modifying_attribute_id", primary_key: "attribute_id"
  add_foreign_key "dogma_effect_modifications", "dogma_effects", column: "effect_id", primary_key: "effect_id"
  add_foreign_key "dogma_effects", "dogma_attributes", column: "attribute_id", primary_key: "attribute_id"
  add_foreign_key "evemails", "characters", column: "from_id", primary_key: "character_id"
  add_foreign_key "event_responses", "characters", primary_key: "character_id"
  add_foreign_key "event_responses", "events", primary_key: "event_id"
  add_foreign_key "extra_cargoholds", "ships", primary_key: "type_id"
  add_foreign_key "extractor_heads", "colony_pins", column: "pin_id", primary_key: "pin_id"
  add_foreign_key "factions", "corporations", primary_key: "corporation_id"
  add_foreign_key "factions", "solar_systems", primary_key: "system_id"
  add_foreign_key "fitting_items", "fittings", primary_key: "fitting_id"
  add_foreign_key "fittings", "characters", column: "creator_id", primary_key: "character_id"
  add_foreign_key "fleet_memberships", "characters", primary_key: "character_id"
  add_foreign_key "fleet_memberships", "fleets", primary_key: "fleet_id"
  add_foreign_key "fleet_memberships", "solar_systems", primary_key: "system_id"
  add_foreign_key "fleet_memberships", "wings", primary_key: "wing_id"
  add_foreign_key "incursions", "constellations", primary_key: "constellation_id"
  add_foreign_key "incursions", "factions", primary_key: "faction_id"
  add_foreign_key "incursions", "solar_systems", column: "staging_system_id", primary_key: "system_id"
  add_foreign_key "industry_cost_indices", "solar_systems", column: "system_id", primary_key: "system_id"
  add_foreign_key "industry_jobs", "blueprints", column: "blueprint_type_id", primary_key: "type_id"
  add_foreign_key "industry_jobs", "characters", column: "completed_character_id", primary_key: "character_id"
  add_foreign_key "industry_jobs", "characters", column: "installer_id", primary_key: "character_id"
  add_foreign_key "infested_systems", "incursions"
  add_foreign_key "infested_systems", "solar_systems", primary_key: "system_id"
  add_foreign_key "item_groups", "item_categories", column: "category_id", primary_key: "category_id"
  add_foreign_key "killmail_attackers", "alliances", column: "attacker_alliance_id", primary_key: "alliance_id"
  add_foreign_key "killmail_attackers", "characters", column: "attacker_id", primary_key: "character_id"
  add_foreign_key "killmail_attackers", "corporations", column: "attacker_corporation_id", primary_key: "corporation_id"
  add_foreign_key "killmail_attackers", "factions", column: "attacker_faction_id", primary_key: "faction_id"
  add_foreign_key "killmail_attackers", "killmails", primary_key: "killmail_id"
  add_foreign_key "killmail_items", "killmail_items"
  add_foreign_key "killmail_items", "killmails", primary_key: "killmail_id"
  add_foreign_key "killmails", "alliances", column: "victim_alliance_id", primary_key: "alliance_id"
  add_foreign_key "killmails", "characters", column: "victim_id", primary_key: "character_id"
  add_foreign_key "killmails", "corporations", column: "victim_corporation_id", primary_key: "corporation_id"
  add_foreign_key "killmails", "factions", column: "victim_faction_id", primary_key: "faction_id"
  add_foreign_key "killmails", "solar_systems", primary_key: "system_id"
  add_foreign_key "mail_label_assignments", "evemails", primary_key: "mail_id"
  add_foreign_key "mail_label_assignments", "mail_labels", column: "label_id", primary_key: "label_id"
  add_foreign_key "mail_labels", "characters", primary_key: "character_id"
  add_foreign_key "mail_recipients", "characters", column: "recipient_id", primary_key: "character_id"
  add_foreign_key "mail_recipients", "evemails", primary_key: "mail_id"
  add_foreign_key "mailing_list_subscriptions", "characters", column: "subscriber_id", primary_key: "character_id"
  add_foreign_key "mailing_list_subscriptions", "mailing_lists", primary_key: "mailing_list_id"
  add_foreign_key "mailing_lists", "characters", column: "creator_id", primary_key: "character_id"
  add_foreign_key "medal_awards", "characters", column: "issuer_id", primary_key: "character_id"
  add_foreign_key "medal_awards", "characters", primary_key: "character_id"
  add_foreign_key "medal_awards", "medals", primary_key: "medal_id"
  add_foreign_key "medals", "corporations", primary_key: "corporation_id"
  add_foreign_key "moons", "planets", primary_key: "planet_id"
  add_foreign_key "moons", "solar_systems", primary_key: "system_id"
  add_foreign_key "opportunities", "opportunity_groups", column: "group_id", primary_key: "group_id"
  add_foreign_key "opportunity_connections", "opportunity_groups", column: "connected_group_id", primary_key: "group_id"
  add_foreign_key "opportunity_connections", "opportunity_groups", column: "group_id", primary_key: "group_id"
  add_foreign_key "personal_blueprints", "blueprints", column: "type_id", primary_key: "type_id"
  add_foreign_key "personal_blueprints", "characters", primary_key: "character_id"
  add_foreign_key "personal_research_agents", "characters", primary_key: "character_id"
  add_foreign_key "planets", "solar_systems", primary_key: "system_id"
  add_foreign_key "races", "alliances", primary_key: "alliance_id"
  add_foreign_key "required_skills", "ships", column: "skill_type_id", primary_key: "type_id"
  add_foreign_key "ships", "factions", primary_key: "faction_id"
  add_foreign_key "skill_queue_entries", "characters", primary_key: "character_id"
  add_foreign_key "skill_queue_entries", "skills", column: "skill_type_id", primary_key: "type_id"
  add_foreign_key "solar_systems", "constellations", primary_key: "constellation_id"
  add_foreign_key "sovereignty_campaigns", "constellations", primary_key: "constellation_id"
  add_foreign_key "sovereignty_campaigns", "solar_systems", primary_key: "system_id"
  add_foreign_key "sovereignty_campaigns", "sovereignty_structures", column: "sov_structure_id", primary_key: "sov_structure_id"
  add_foreign_key "sovereignty_structures", "alliances", primary_key: "alliance_id"
  add_foreign_key "sovereignty_structures", "solar_systems", primary_key: "system_id"
  add_foreign_key "squads", "fleets", primary_key: "fleet_id"
  add_foreign_key "squads", "wings", primary_key: "wing_id"
  add_foreign_key "standings", "characters", primary_key: "character_id"
  add_foreign_key "stargates", "solar_systems", column: "destination_id", primary_key: "system_id"
  add_foreign_key "stargates", "solar_systems", primary_key: "system_id"
  add_foreign_key "stargates", "stargates", column: "destination_stargate_id", primary_key: "stargate_id"
  add_foreign_key "war_allies", "wars", primary_key: "war_id"
  add_foreign_key "wings", "fleets", primary_key: "fleet_id"
end
