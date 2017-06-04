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

ActiveRecord::Schema.define(version: 20170604231448) do

  create_table "alliance_histories", force: :cascade do |t|
    t.integer "alliance_id", null: false
    t.integer "corporation_id", null: false
    t.integer "record_id", null: false
    t.datetime "start_date", null: false
    t.index ["alliance_id"], name: "index_alliance_histories_on_alliance_id"
    t.index ["corporation_id", "alliance_id"], name: "index_alliance_histories_on_corporation_id_and_alliance_id"
    t.index ["corporation_id"], name: "index_alliance_histories_on_corporation_id"
  end

  create_table "alliances", id: false, force: :cascade do |t|
    t.integer "alliance_id", null: false
    t.integer "executor_corporation_id", null: false
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
    t.integer "multiple", default: 1, null: false
    t.integer "type_id", null: false
    t.string "location_flag", null: false
    t.string "location_type"
    t.integer "location_id"
    t.string "owner_type"
    t.integer "owner_id"
    t.integer "quantity"
    t.index ["item_id"], name: "index_assets_on_item_id", unique: true
    t.index ["location_type", "location_id"], name: "index_assets_on_location_type_and_location_id"
    t.index ["multiple"], name: "index_assets_on_multiple"
    t.index ["owner_type", "owner_id"], name: "index_assets_on_owner_type_and_owner_id"
    t.index ["type_id"], name: "index_assets_on_type_id"
  end

  create_table "bloodlines", id: false, force: :cascade do |t|
    t.integer "bloodline_id", null: false
    t.integer "race_id", null: false
    t.integer "corporation_id"
    t.integer "ship_type_id"
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

  create_table "bookmarks", id: false, force: :cascade do |t|
    t.integer "bookmark_id", null: false
    t.integer "creator_id", null: false
    t.integer "location_id", null: false
    t.datetime "create_date", null: false
    t.integer "folder_id"
    t.integer "type_id"
    t.integer "item_id"
    t.string "owner_type"
    t.integer "owner_id"
    t.text "memo"
    t.text "note"
    t.float "x"
    t.float "y"
    t.float "z"
    t.index ["bookmark_id"], name: "index_bookmarks_on_bookmark_id", unique: true
    t.index ["creator_id"], name: "index_bookmarks_on_creator_id"
    t.index ["folder_id"], name: "index_bookmarks_on_folder_id"
    t.index ["item_id"], name: "index_bookmarks_on_item_id"
    t.index ["location_id"], name: "index_bookmarks_on_location_id"
    t.index ["owner_type", "owner_id"], name: "index_bookmarks_on_owner_type_and_owner_id"
    t.index ["type_id"], name: "index_bookmarks_on_type_id"
  end

  create_table "bookmarks_folders", id: false, force: :cascade do |t|
    t.integer "folder_id", null: false
    t.string "owner_type"
    t.integer "owner_id"
    t.string "name"
    t.index ["folder_id"], name: "index_bookmarks_folders_on_folder_id", unique: true
    t.index ["owner_type", "owner_id"], name: "index_bookmarks_folders_on_owner_type_and_owner_id"
  end

  create_table "channel_allows", id: false, force: :cascade do |t|
    t.integer "channel_id", null: false
    t.string "allowed_type"
    t.integer "allowed_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["allowed_type", "allowed_id"], name: "index_channel_allows_on_allowed_type_and_allowed_id"
    t.index ["channel_id"], name: "index_channel_allows_on_channel_id"
  end

  create_table "channel_blocks", id: false, force: :cascade do |t|
    t.integer "channel_id", null: false
    t.string "blocked_type"
    t.integer "blocked_id", null: false
    t.datetime "ends"
    t.text "reason"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["blocked_type", "blocked_id"], name: "index_channel_blocks_on_blocked_type_and_blocked_id"
    t.index ["channel_id"], name: "index_channel_blocks_on_channel_id"
  end

  create_table "channel_mutes", id: false, force: :cascade do |t|
    t.integer "channel_id", null: false
    t.string "muted_type"
    t.integer "muted_id", null: false
    t.datetime "ends"
    t.text "reason"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["channel_id"], name: "index_channel_mutes_on_channel_id"
    t.index ["muted_type", "muted_id"], name: "index_channel_mutes_on_muted_type_and_muted_id"
  end

  create_table "channel_operators", id: false, force: :cascade do |t|
    t.integer "channel_id", null: false
    t.string "operator_type"
    t.integer "operator_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["channel_id"], name: "index_channel_operators_on_channel_id"
    t.index ["operator_type", "operator_id"], name: "index_channel_operators_on_operator_type_and_operator_id"
  end

  create_table "characters", id: false, force: :cascade do |t|
    t.integer "character_id", null: false
    t.integer "corporation_id", null: false
    t.integer "gender", default: 1, null: false
    t.string "name", null: false
    t.datetime "birthday", null: false
    t.integer "race_id", null: false
    t.integer "bloodline_id", null: false
    t.integer "alliance_id"
    t.decimal "security_status"
    t.integer "ancestry_id"
    t.text "description"
    t.datetime "last_clone_jump"
    t.string "portrait_64"
    t.string "portrait_128"
    t.string "portrait_256"
    t.string "portrait_512"
    t.string "home_station_type"
    t.integer "home_station_id"
    t.string "current_location_type"
    t.integer "current_location_id"
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
    t.integer "owner_id", null: false
    t.string "comparison_key", null: false
    t.string "name"
    t.text "motd"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["channel_id"], name: "index_chat_channels_on_channel_id", unique: true
    t.index ["owner_id"], name: "index_chat_channels_on_owner_id"
    t.index ["password"], name: "index_chat_channels_on_password"
  end

  create_table "contact_labels", id: false, force: :cascade do |t|
    t.integer "label_id", null: false
    t.integer "character_id", null: false
    t.string "name"
    t.index ["character_id"], name: "index_contact_labels_on_character_id"
    t.index ["label_id"], name: "index_contact_labels_on_label_id", unique: true
  end

  create_table "contacts", id: false, force: :cascade do |t|
    t.string "diplomacy_type"
    t.integer "diplomacy_id", null: false
    t.integer "character_id", null: false
    t.integer "blocklist", default: 0, null: false
    t.integer "watchlist", default: 0, null: false
    t.integer "label_id"
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
    t.integer "character_id", null: false
    t.integer "corporation_id", null: false
    t.integer "record_id", null: false
    t.datetime "start_date", null: false
    t.index ["character_id", "corporation_id"], name: "index_corporation_histories_on_character_id_and_corporation_id"
    t.index ["character_id"], name: "index_corporation_histories_on_character_id"
    t.index ["corporation_id"], name: "index_corporation_histories_on_corporation_id"
  end

  create_table "corporations", id: false, force: :cascade do |t|
    t.integer "corporation_id", null: false
    t.integer "ceo_id", null: false
    t.decimal "tax_rate", precision: 4, scale: 3, null: false
    t.string "ticker", limit: 5, null: false
    t.string "name", null: false
    t.integer "creator_id", null: false
    t.integer "alliance_id"
    t.integer "faction_id"
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
    t.integer "attribute_id", null: false
    t.integer "type_id", null: false
    t.float "value", null: false
    t.index ["attribute_id"], name: "index_dogma_attribute_values_on_attribute_id"
    t.index ["type_id", "attribute_id"], name: "index_dogma_attribute_values_on_type_id_and_attribute_id"
    t.index ["type_id"], name: "index_dogma_attribute_values_on_type_id"
  end

  create_table "dogma_attributes", id: false, force: :cascade do |t|
    t.integer "attribute_id", null: false
    t.integer "data_export", default: 1, null: false
    t.integer "unit_id"
    t.integer "good"
    t.integer "stacking"
    t.integer "icon_id"
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

  create_table "dogma_effect_values", id: false, force: :cascade do |t|
    t.integer "effect_id", null: false
    t.integer "type_id", null: false
    t.boolean "default_value"
    t.index ["effect_id"], name: "index_dogma_effect_values_on_effect_id"
    t.index ["type_id", "effect_id"], name: "index_dogma_effect_values_on_type_id_and_effect_id"
    t.index ["type_id"], name: "index_dogma_effect_values_on_type_id"
  end

  create_table "dogma_effects", id: false, force: :cascade do |t|
    t.integer "effect_id", null: false
    t.integer "attribute_id"
    t.string "attribute_type"
    t.string "name"
    t.string "display_name"
    t.text "description"
    t.integer "effect_category"
    t.integer "icon_id"
    t.integer "pre_expression"
    t.integer "post_expression"
    t.boolean "electronic_chance"
    t.boolean "assistance"
    t.boolean "offensive"
    t.boolean "warp_safe"
    t.boolean "range_chance"
    t.string "domain"
    t.string "func"
    t.integer "operator"
    t.integer "modified_attribute_id"
    t.integer "modifying_attribute_id"
    t.integer "auto_repeat"
    t.integer "data_export"
    t.index ["attribute_id"], name: "index_dogma_effects_on_attribute_id"
    t.index ["effect_id"], name: "index_dogma_effects_on_effect_id", unique: true
    t.index ["modified_attribute_id"], name: "index_dogma_effects_on_modified_attribute_id"
    t.index ["modifying_attribute_id"], name: "index_dogma_effects_on_modifying_attribute_id"
  end

  create_table "event_responses", id: false, force: :cascade do |t|
    t.integer "event_id", null: false
    t.integer "character_id", null: false
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
    t.integer "host_id"
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

  create_table "factions", id: false, force: :cascade do |t|
    t.integer "faction_id", null: false
    t.integer "uniqueness", default: 1, null: false
    t.integer "corporation_id", null: false
    t.string "name", null: false
    t.integer "solar_system_id"
    t.text "description"
    t.integer "size_factor"
    t.integer "station_count"
    t.integer "station_system_count"
    t.index ["corporation_id"], name: "index_factions_on_corporation_id"
    t.index ["faction_id"], name: "index_factions_on_faction_id", unique: true
    t.index ["solar_system_id"], name: "index_factions_on_solar_system_id"
    t.index ["uniqueness"], name: "index_factions_on_uniqueness"
  end

  create_table "fleet_memberships", id: false, force: :cascade do |t|
    t.integer "character_id", null: false
    t.integer "fleet_id", null: false
    t.integer "wing_id", null: false
    t.integer "squad_id", null: false
    t.integer "ship_type_id", null: false
    t.integer "solar_system_id", null: false
    t.integer "fleet_warp", default: 1, null: false
    t.integer "role", default: 1, null: false
    t.datetime "join_time", null: false
    t.string "role_name", null: false
    t.string "dock_type"
    t.integer "dock_id"
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

  create_table "industry_jobs", id: false, force: :cascade do |t|
    t.integer "job_id", null: false
    t.integer "activity_id", null: false
    t.integer "blueprint_id", null: false
    t.integer "blueprint_type_id", null: false
    t.integer "facility_id", null: false
    t.integer "installer_id", null: false
    t.integer "completed_character_id"
    t.string "product_type"
    t.integer "product_id"
    t.string "job_blueprint_location_type"
    t.integer "job_blueprint_location_id", null: false
    t.string "output_location_type"
    t.integer "output_location_id", null: false
    t.string "job_location_type"
    t.integer "job_location_id", null: false
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
    t.index ["job_location_type", "job_location_id"], name: "index_industry_jobs_on_job_location_type_and_job_location_id"
    t.index ["output_location_type", "output_location_id"], name: "output_location_index"
    t.index ["product_type", "product_id"], name: "index_industry_jobs_on_product_type_and_product_id"
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
    t.integer "category_id", null: false
    t.string "name", null: false
    t.index ["category_id"], name: "index_item_groups_on_category_id"
    t.index ["data_export"], name: "index_item_groups_on_data_export"
    t.index ["group_id"], name: "index_item_groups_on_group_id", unique: true
  end

  create_table "items", id: false, force: :cascade do |t|
    t.integer "type_id", null: false
    t.integer "data_export", default: 1, null: false
    t.string "type", null: false
    t.integer "group_id", null: false
    t.string "name", null: false
    t.integer "icon_id"
    t.integer "graphic_id"
    t.text "description"
    t.float "radius"
    t.float "volume"
    t.float "capacity"
    t.float "portion_size"
    t.float "mass"
    t.index ["data_export"], name: "index_items_on_data_export"
    t.index ["graphic_id"], name: "index_items_on_graphic_id"
    t.index ["group_id"], name: "index_items_on_group_id"
    t.index ["icon_id"], name: "index_items_on_icon_id"
    t.index ["type"], name: "index_items_on_type"
    t.index ["type_id"], name: "index_items_on_type_id", unique: true
  end

  create_table "killmail_attackers", id: false, force: :cascade do |t|
    t.integer "killmail_id", null: false
    t.integer "attacker_id", null: false
    t.integer "attacker_corporation_id"
    t.integer "attacker_alliance_id"
    t.integer "attacker_faction_id"
    t.integer "ship_type_id"
    t.integer "weapon_type_id"
    t.decimal "security_status"
    t.integer "damage_dealt"
    t.index ["attacker_alliance_id"], name: "index_killmail_attackers_on_attacker_alliance_id"
    t.index ["attacker_corporation_id"], name: "index_killmail_attackers_on_attacker_corporation_id"
    t.index ["attacker_faction_id"], name: "index_killmail_attackers_on_attacker_faction_id"
    t.index ["attacker_id", "killmail_id"], name: "index_killmail_attackers_on_attacker_id_and_killmail_id"
    t.index ["attacker_id"], name: "index_killmail_attackers_on_attacker_id"
    t.index ["killmail_id"], name: "index_killmail_attackers_on_killmail_id"
    t.index ["ship_type_id"], name: "index_killmail_attackers_on_ship_type_id"
    t.index ["weapon_type_id"], name: "index_killmail_attackers_on_weapon_type_id"
  end

  create_table "killmail_items", force: :cascade do |t|
    t.integer "killmail_id", null: false
    t.integer "stack", default: 1, null: false
    t.integer "killmail_item_id"
    t.string "killmail_loot_type"
    t.integer "killmail_loot_id", null: false
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
    t.integer "victim_id", null: false
    t.integer "solar_system_id", null: false
    t.integer "victim_ship_type_id", null: false
    t.integer "victim_corporation_id"
    t.integer "victim_alliance_id"
    t.integer "victim_faction_id"
    t.integer "moon_id"
    t.integer "war_id"
    t.string "final_blow_type"
    t.integer "final_blow_id", null: false
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

  create_table "medal_awards", id: false, force: :cascade do |t|
    t.integer "character_id", null: false
    t.integer "medal_id", null: false
    t.integer "issuer_id", null: false
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
    t.integer "corporation_id", null: false
    t.string "title", null: false
    t.text "description"
    t.string "graphic", null: false
    t.integer "layer", null: false
    t.integer "part", null: false
    t.integer "color"
    t.index ["corporation_id"], name: "index_medals_on_corporation_id"
    t.index ["medal_id"], name: "index_medals_on_medal_id", unique: true
  end

  create_table "personal_blueprints", id: false, force: :cascade do |t|
    t.integer "item_id", null: false
    t.integer "type_id", null: false
    t.integer "character_id", null: false
    t.integer "material_efficiency", null: false
    t.integer "quantity", null: false
    t.integer "runs", null: false
    t.integer "time_efficiency", null: false
    t.string "location_type"
    t.integer "location_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["character_id", "type_id"], name: "index_personal_blueprints_on_character_id_and_type_id"
    t.index ["character_id"], name: "index_personal_blueprints_on_character_id"
    t.index ["item_id"], name: "index_personal_blueprints_on_item_id", unique: true
    t.index ["location_type", "location_id"], name: "item_location_index"
    t.index ["type_id"], name: "index_personal_blueprints_on_type_id"
  end

  create_table "personal_research_agents", id: false, force: :cascade do |t|
    t.integer "character_id", null: false
    t.integer "agent_id", null: false
    t.integer "skill_type_id", null: false
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

  create_table "races", id: false, force: :cascade do |t|
    t.integer "race_id", null: false
    t.integer "alliance_id", null: false
    t.string "name", null: false
    t.text "description"
    t.index ["alliance_id"], name: "index_races_on_alliance_id"
    t.index ["race_id"], name: "index_races_on_race_id", unique: true
  end

  create_table "squads", id: false, force: :cascade do |t|
    t.integer "squad_id", null: false
    t.integer "fleet_id", null: false
    t.integer "wing_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["fleet_id"], name: "index_squads_on_fleet_id"
    t.index ["squad_id"], name: "index_squads_on_squad_id", unique: true
    t.index ["wing_id"], name: "index_squads_on_wing_id"
  end

  create_table "standings", id: false, force: :cascade do |t|
    t.string "relationship_type"
    t.integer "relationship_id", null: false
    t.integer "character_id", null: false
    t.float "standing", default: 0.0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["character_id"], name: "index_standings_on_character_id"
    t.index ["relationship_type", "relationship_id"], name: "index_standings_on_relationship_type_and_relationship_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "wings", id: false, force: :cascade do |t|
    t.integer "wing_id", null: false
    t.integer "fleet_id", null: false
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["fleet_id"], name: "index_wings_on_fleet_id"
    t.index ["wing_id"], name: "index_wings_on_wing_id", unique: true
  end

end
