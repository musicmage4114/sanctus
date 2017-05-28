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

ActiveRecord::Schema.define(version: 20170526235940) do

  create_table "alliance_histories", force: :cascade do |t|
    t.integer "alliance_id", null: false
    t.integer "corporation_id", null: false
    t.integer "record_id", null: false
    t.datetime "start_date", null: false
    t.index ["alliance_id"], name: "index_alliance_histories_on_alliance_id"
    t.index ["corporation_id"], name: "index_alliance_histories_on_corporation_id"
  end

  create_table "alliances", id: false, force: :cascade do |t|
    t.integer "alliance_id", null: false
    t.string "name", null: false
    t.string "ticker", limit: 5, null: false
    t.datetime "date_founded", null: false
    t.integer "executor_corporation_id", null: false
    t.string "icon_64"
    t.string "icon_128"
    t.integer "deletion"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["alliance_id"], name: "index_alliances_on_alliance_id", unique: true
    t.index ["deletion"], name: "index_alliances_on_deletion"
    t.index ["executor_corporation_id"], name: "index_alliances_on_executor_corporation_id", unique: true
  end

  create_table "assets", id: false, force: :cascade do |t|
    t.integer "item_id", null: false
    t.integer "type_id", null: false
    t.integer "quantity"
    t.string "location_flag", null: false
    t.string "location_type"
    t.integer "location_id"
    t.string "owner_type"
    t.integer "owner_id"
    t.integer "multiple", default: 1, null: false
    t.index ["item_id"], name: "index_assets_on_item_id", unique: true
    t.index ["location_type", "location_id"], name: "index_assets_on_location_type_and_location_id"
    t.index ["multiple"], name: "index_assets_on_multiple"
    t.index ["owner_type", "owner_id"], name: "index_assets_on_owner_type_and_owner_id"
    t.index ["type_id"], name: "index_assets_on_type_id"
  end

  create_table "bookmarks", id: false, force: :cascade do |t|
    t.integer "bookmark_id", null: false
    t.integer "creator_id", null: false
    t.integer "folder_id"
    t.datetime "create_date", null: false
    t.text "memo"
    t.text "note"
    t.string "owner_type"
    t.integer "owner_id"
    t.integer "location_id", null: false
    t.integer "item_id"
    t.integer "type_id_id"
    t.float "x"
    t.float "y"
    t.float "z"
    t.index ["bookmark_id"], name: "index_bookmarks_on_bookmark_id", unique: true
    t.index ["creator_id"], name: "index_bookmarks_on_creator_id"
    t.index ["folder_id"], name: "index_bookmarks_on_folder_id"
    t.index ["location_id"], name: "index_bookmarks_on_location_id"
    t.index ["owner_type", "owner_id"], name: "index_bookmarks_on_owner_type_and_owner_id"
    t.index ["type_id_id"], name: "index_bookmarks_on_type_id_id"
  end

  create_table "bookmarks_folders", id: false, force: :cascade do |t|
    t.integer "folder_id", null: false
    t.string "owner_type"
    t.integer "owner_id"
    t.string "name"
    t.index ["folder_id"], name: "index_bookmarks_folders_on_folder_id", unique: true
    t.index ["owner_type", "owner_id"], name: "index_bookmarks_folders_on_owner_type_and_owner_id"
  end

  create_table "characters", id: false, force: :cascade do |t|
    t.integer "character_id", null: false
    t.integer "corporation_id", null: false
    t.integer "alliance_id"
    t.string "name", null: false
    t.datetime "birthday", null: false
    t.decimal "security_status"
    t.integer "race_id", null: false
    t.integer "bloodline_id", null: false
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
    t.integer "gender", default: 1, null: false
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

  create_table "corporations", id: false, force: :cascade do |t|
    t.integer "corporation_id", null: false
    t.integer "alliance_id"
    t.integer "faction_id"
    t.string "name", null: false
    t.string "ticker", limit: 5, null: false
    t.decimal "tax_rate", precision: 4, scale: 3, null: false
    t.datetime "creation_date"
    t.integer "member_count"
    t.integer "ceo_id", null: false
    t.integer "creator_id", null: false
    t.string "url"
    t.text "description"
    t.string "faction_name"
    t.string "icon_64"
    t.string "icon_128"
    t.string "icon_256"
    t.integer "deletion"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["alliance_id"], name: "index_corporations_on_alliance_id"
    t.index ["ceo_id"], name: "index_corporations_on_ceo_id", unique: true
    t.index ["corporation_id"], name: "index_corporations_on_corporation_id", unique: true
    t.index ["creator_id"], name: "index_corporations_on_creator_id"
    t.index ["deletion"], name: "index_corporations_on_deletion"
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
    t.float "default_value"
    t.text "description"
    t.string "display_name"
    t.integer "icon_id"
    t.string "name"
    t.integer "unit_id"
    t.integer "good"
    t.integer "stacking"
    t.integer "usage", default: 1, null: false
    t.index ["attribute_id"], name: "index_dogma_attributes_on_attribute_id", unique: true
    t.index ["good"], name: "index_dogma_attributes_on_good"
    t.index ["icon_id"], name: "index_dogma_attributes_on_icon_id"
    t.index ["stacking"], name: "index_dogma_attributes_on_stacking"
    t.index ["unit_id"], name: "index_dogma_attributes_on_unit_id"
    t.index ["usage"], name: "index_dogma_attributes_on_usage"
  end

  create_table "events", force: :cascade do |t|
    t.integer "event_id"
    t.datetime "date"
    t.integer "duration"
    t.text "description"
    t.string "title"
    t.string "host_type"
    t.integer "host_id"
    t.string "host_name"
    t.integer "importance"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["host_type", "host_id"], name: "index_events_on_host_type_and_host_id"
    t.index ["importance"], name: "index_events_on_importance"
  end

  create_table "item_categories", id: false, force: :cascade do |t|
    t.integer "category_id", null: false
    t.string "name", null: false
    t.integer "usage", default: 1, null: false
    t.index ["category_id"], name: "index_item_categories_on_category_id", unique: true
    t.index ["usage"], name: "index_item_categories_on_usage"
  end

  create_table "item_groups", id: false, force: :cascade do |t|
    t.integer "group_id", null: false
    t.string "name", null: false
    t.integer "category_id", null: false
    t.integer "usage", default: 1, null: false
    t.index ["category_id"], name: "index_item_groups_on_category_id"
    t.index ["group_id"], name: "index_item_groups_on_group_id", unique: true
    t.index ["usage"], name: "index_item_groups_on_usage"
  end

  create_table "items", id: false, force: :cascade do |t|
    t.integer "type_id", null: false
    t.string "type", null: false
    t.string "name", null: false
    t.text "description"
    t.integer "group_id", null: false
    t.integer "graphic_id"
    t.float "radius"
    t.float "volume"
    t.integer "icon_id"
    t.float "capacity"
    t.float "portion_size"
    t.float "mass"
    t.integer "usage", default: 1, null: false
    t.index ["graphic_id"], name: "index_items_on_graphic_id"
    t.index ["group_id"], name: "index_items_on_group_id"
    t.index ["icon_id"], name: "index_items_on_icon_id"
    t.index ["type"], name: "index_items_on_type"
    t.index ["type_id"], name: "index_items_on_type_id", unique: true
    t.index ["usage"], name: "index_items_on_usage"
  end

  create_table "personal_blueprints", id: false, force: :cascade do |t|
    t.integer "item_id", null: false
    t.integer "type_id", null: false
    t.integer "character_id", null: false
    t.string "location_type", null: false
    t.integer "location_id", null: false
    t.integer "material_efficiency", null: false
    t.integer "quantity", null: false
    t.integer "runs", null: false
    t.integer "time_efficiency", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["character_id", "type_id"], name: "index_personal_blueprints_on_character_id_and_type_id"
    t.index ["character_id"], name: "index_personal_blueprints_on_character_id"
    t.index ["item_id"], name: "index_personal_blueprints_on_item_id", unique: true
    t.index ["location_type", "location_id"], name: "item_location_index"
    t.index ["type_id"], name: "index_personal_blueprints_on_type_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
