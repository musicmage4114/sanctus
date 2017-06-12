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

ActiveRecord::Schema.define(version: 20170612022813) do

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
  end

  create_table "bloodlines", primary_key: "bloodline_id", id: :integer, default: nil, force: :cascade do |t|
    t.string "bloodlineName", limit: 100
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
    t.index ["race_id"], name: "index_bloodlines_on_race_id"
    t.index ["ship_type_id"], name: "index_bloodlines_on_ship_type_id"
  end

  create_table "certCerts", primary_key: "certID", id: :integer, default: nil, force: :cascade do |t|
    t.text "description"
    t.integer "groupID"
    t.string "name", limit: 255
  end

  create_table "certMasteries", id: false, force: :cascade do |t|
    t.integer "typeID"
    t.integer "masteryLevel"
    t.integer "certID"
  end

  create_table "certSkills", id: false, force: :cascade do |t|
    t.integer "certID"
    t.integer "skillID"
    t.integer "certLevelInt"
    t.integer "skillLevel"
    t.string "certLevelText", limit: 8
    t.index ["skillID"], name: "ix_certSkills_skillID"
  end

  create_table "chrAttributes", primary_key: "attributeID", id: :integer, default: nil, force: :cascade do |t|
    t.string "attributeName", limit: 100
    t.string "description", limit: 1000
    t.integer "iconID"
    t.string "shortDescription", limit: 500
    t.string "notes", limit: 500
  end

  create_table "corp_division_details", primary_key: "division_id", id: :integer, default: nil, force: :cascade do |t|
    t.string "divisionName", limit: 100
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
    t.bigint "alliance_id_id"
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
    t.index ["alliance_id_id"], name: "index_corporations_on_alliance_id_id"
    t.index ["ceo_id"], name: "index_corporations_on_ceo_id"
    t.index ["creator_id"], name: "index_corporations_on_creator_id"
    t.index ["enemy_id"], name: "index_corporations_on_enemy_id"
    t.index ["faction_id"], name: "index_corporations_on_faction_id"
    t.index ["friend_id"], name: "index_corporations_on_friend_id"
    t.index ["integer_id"], name: "index_corporations_on_integer_id"
    t.index ["solar_system_id"], name: "index_corporations_on_solar_system_id"
  end

  create_table "crpActivities", primary_key: "activityID", id: :integer, default: nil, force: :cascade do |t|
    t.string "activityName", limit: 100
    t.string "description", limit: 1000
  end

  create_table "crpNPCCorporationTrades", primary_key: ["corporationID", "typeID"], force: :cascade do |t|
    t.integer "corporationID", null: false
    t.integer "typeID", null: false
  end

  create_table "dgmTypeAttributes", primary_key: ["typeID", "attributeID"], force: :cascade do |t|
    t.integer "typeID", null: false
    t.integer "attributeID", null: false
    t.integer "valueInt"
    t.float "valueFloat"
    t.index ["attributeID"], name: "ix_dgmTypeAttributes_attributeID"
  end

  create_table "dgmTypeEffects", primary_key: ["typeID", "effectID"], force: :cascade do |t|
    t.integer "typeID", null: false
    t.integer "effectID", null: false
    t.boolean "isDefault"
  end

  create_table "dogma_attribute_categories", primary_key: "category_id", id: :integer, default: nil, force: :cascade do |t|
    t.string "name", limit: 50
    t.string "description", limit: 200
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
    t.index ["icon_id"], name: "index_dogma_attributes_on_icon_id"
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

  create_table "eveGraphics", primary_key: "graphicID", id: :integer, default: nil, force: :cascade do |t|
    t.string "sofFactionName", limit: 100
    t.string "graphicFile", limit: 100
    t.string "sofHullName", limit: 100
    t.string "sofRaceName", limit: 100
    t.text "description"
  end

  create_table "eveIcons", primary_key: "iconID", id: :integer, default: nil, force: :cascade do |t|
    t.string "iconFile", limit: 500
    t.text "description"
  end

  create_table "eveUnits", primary_key: "unitID", id: :integer, default: nil, force: :cascade do |t|
    t.string "unitName", limit: 100
    t.string "displayName", limit: 50
    t.string "description", limit: 1000
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
    t.index ["member_race"], name: "index_factions_on_member_race"
    t.index ["militia_corporation_id"], name: "index_factions_on_militia_corporation_id"
    t.index ["race_id"], name: "index_factions_on_race_id"
    t.index ["solar_system_id"], name: "index_factions_on_solar_system_id"
  end

  create_table "industryActivity", primary_key: ["typeID", "activityID"], force: :cascade do |t|
    t.integer "typeID", null: false
    t.integer "activityID", null: false
    t.integer "time"
    t.index ["activityID"], name: "ix_industryActivity_activityID"
  end

  create_table "industryActivityMaterials", id: false, force: :cascade do |t|
    t.integer "typeID"
    t.integer "activityID"
    t.integer "materialTypeID"
    t.integer "quantity"
    t.index ["typeID", "activityID"], name: "industryActivityMaterials_idx1"
    t.index ["typeID"], name: "ix_industryActivityMaterials_typeID"
  end

  create_table "industryActivityProbabilities", id: false, force: :cascade do |t|
    t.integer "typeID"
    t.integer "activityID"
    t.integer "productTypeID"
    t.decimal "probability", precision: 3, scale: 2
    t.index ["productTypeID"], name: "ix_industryActivityProbabilities_productTypeID"
    t.index ["typeID"], name: "ix_industryActivityProbabilities_typeID"
  end

  create_table "industryActivityProducts", id: false, force: :cascade do |t|
    t.integer "typeID"
    t.integer "activityID"
    t.integer "productTypeID"
    t.integer "quantity"
    t.index ["productTypeID"], name: "ix_industryActivityProducts_productTypeID"
    t.index ["typeID"], name: "ix_industryActivityProducts_typeID"
  end

  create_table "industryActivityRaces", id: false, force: :cascade do |t|
    t.integer "typeID"
    t.integer "activityID"
    t.integer "productTypeID"
    t.integer "raceID"
    t.index ["productTypeID"], name: "ix_industryActivityRaces_productTypeID"
    t.index ["typeID"], name: "ix_industryActivityRaces_typeID"
  end

  create_table "industryActivitySkills", id: false, force: :cascade do |t|
    t.integer "typeID"
    t.integer "activityID"
    t.integer "skillID"
    t.integer "level"
    t.index ["skillID"], name: "ix_industryActivitySkills_skillID"
    t.index ["typeID", "activityID"], name: "industryActivitySkills_idx1"
    t.index ["typeID"], name: "ix_industryActivitySkills_typeID"
  end

  create_table "industryBlueprints", primary_key: "typeID", id: :integer, default: nil, force: :cascade do |t|
    t.integer "maxProductionLimit"
  end

  create_table "invCategories", primary_key: "categoryID", id: :integer, default: nil, force: :cascade do |t|
    t.string "categoryName", limit: 100
    t.integer "iconID"
    t.boolean "published"
  end

  create_table "invContrabandTypes", primary_key: ["factionID", "typeID"], force: :cascade do |t|
    t.integer "factionID", null: false
    t.integer "typeID", null: false
    t.float "standingLoss"
    t.float "confiscateMinSec"
    t.float "fineByValue"
    t.float "attackMinSec"
    t.index ["typeID"], name: "ix_invContrabandTypes_typeID"
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

  create_table "invFlags", primary_key: "flagID", id: :integer, default: nil, force: :cascade do |t|
    t.string "flagName", limit: 200
    t.string "flagText", limit: 100
    t.integer "orderID"
  end

  create_table "invGroups", primary_key: "groupID", id: :integer, default: nil, force: :cascade do |t|
    t.integer "categoryID"
    t.string "groupName", limit: 100
    t.integer "iconID"
    t.boolean "useBasePrice"
    t.boolean "anchored"
    t.boolean "anchorable"
    t.boolean "fittableNonSingleton"
    t.boolean "published"
    t.index ["categoryID"], name: "ix_invGroups_categoryID"
  end

  create_table "invItems", primary_key: "itemID", id: :integer, default: nil, force: :cascade do |t|
    t.integer "typeID", null: false
    t.integer "ownerID", null: false
    t.integer "locationID", null: false
    t.integer "flagID", null: false
    t.integer "quantity", null: false
    t.index ["locationID"], name: "ix_invItems_locationID"
    t.index ["ownerID", "locationID"], name: "items_IX_OwnerLocation"
  end

  create_table "invMarketGroups", primary_key: "marketGroupID", id: :integer, default: nil, force: :cascade do |t|
    t.integer "parentGroupID"
    t.string "marketGroupName", limit: 100
    t.string "description", limit: 3000
    t.integer "iconID"
    t.boolean "hasTypes"
  end

  create_table "invMetaGroups", primary_key: "metaGroupID", id: :integer, default: nil, force: :cascade do |t|
    t.string "metaGroupName", limit: 100
    t.string "description", limit: 1000
    t.integer "iconID"
  end

  create_table "invMetaTypes", primary_key: "typeID", id: :integer, default: nil, force: :cascade do |t|
    t.integer "parentTypeID"
    t.integer "metaGroupID"
  end

  create_table "invNames", primary_key: "itemID", id: :integer, default: nil, force: :cascade do |t|
    t.string "itemName", limit: 200, null: false
  end

  create_table "invPositions", primary_key: "itemID", id: :integer, default: nil, force: :cascade do |t|
    t.float "x", null: false
    t.float "y", null: false
    t.float "z", null: false
    t.float "yaw"
    t.float "pitch"
    t.float "roll"
  end

  create_table "invTraits", primary_key: "traitID", id: :serial, force: :cascade do |t|
    t.integer "typeID"
    t.integer "skillID"
    t.float "bonus"
    t.text "bonusText"
    t.integer "unitID"
  end

  create_table "invTypeMaterials", primary_key: ["typeID", "materialTypeID"], force: :cascade do |t|
    t.integer "typeID", null: false
    t.integer "materialTypeID", null: false
    t.integer "quantity", null: false
  end

  create_table "invTypeReactions", primary_key: ["reactionTypeID", "input", "typeID"], force: :cascade do |t|
    t.integer "reactionTypeID", null: false
    t.boolean "input", null: false
    t.integer "typeID", null: false
    t.integer "quantity"
  end

  create_table "invTypes", primary_key: "typeID", id: :integer, default: nil, force: :cascade do |t|
    t.integer "groupID"
    t.string "typeName", limit: 100
    t.text "description"
    t.float "mass"
    t.float "volume"
    t.float "capacity"
    t.integer "portionSize"
    t.integer "raceID"
    t.decimal "basePrice", precision: 19, scale: 4
    t.boolean "published"
    t.integer "marketGroupID"
    t.integer "iconID"
    t.integer "soundID"
    t.integer "graphicID"
    t.index ["groupID"], name: "ix_invTypes_groupID"
  end

  create_table "invUniqueNames", primary_key: "itemID", id: :integer, default: nil, force: :cascade do |t|
    t.string "itemName", limit: 200, null: false
    t.integer "groupID"
    t.index ["groupID", "itemName"], name: "invUniqueNames_IX_GroupName"
    t.index ["itemName"], name: "ix_invUniqueNames_itemName", unique: true
  end

  create_table "invVolumes", primary_key: "typeID", id: :integer, default: nil, force: :cascade do |t|
    t.integer "volume"
  end

  create_table "mapCelestialStatistics", primary_key: "celestialID", id: :integer, default: nil, force: :cascade do |t|
    t.float "temperature"
    t.string "spectralClass", limit: 10
    t.float "luminosity"
    t.float "age"
    t.float "life"
    t.float "orbitRadius"
    t.float "eccentricity"
    t.float "massDust"
    t.float "massGas"
    t.boolean "fragmented"
    t.float "density"
    t.float "surfaceGravity"
    t.float "escapeVelocity"
    t.float "orbitPeriod"
    t.float "rotationRate"
    t.boolean "locked"
    t.bigint "pressure"
    t.bigint "radius"
    t.integer "mass"
  end

  create_table "mapConstellationJumps", primary_key: ["fromConstellationID", "toConstellationID"], force: :cascade do |t|
    t.integer "fromRegionID"
    t.integer "fromConstellationID", null: false
    t.integer "toConstellationID", null: false
    t.integer "toRegionID"
  end

  create_table "mapConstellations", primary_key: "constellationID", id: :integer, default: nil, force: :cascade do |t|
    t.integer "regionID"
    t.string "constellationName", limit: 100
    t.float "x"
    t.float "y"
    t.float "z"
    t.float "xMin"
    t.float "xMax"
    t.float "yMin"
    t.float "yMax"
    t.float "zMin"
    t.float "zMax"
    t.integer "factionID"
    t.float "radius"
  end

  create_table "mapDenormalize", primary_key: "itemID", id: :integer, default: nil, force: :cascade do |t|
    t.integer "typeID"
    t.integer "groupID"
    t.integer "solarSystemID"
    t.integer "constellationID"
    t.integer "regionID"
    t.integer "orbitID"
    t.float "x"
    t.float "y"
    t.float "z"
    t.float "radius"
    t.string "itemName", limit: 100
    t.float "security"
    t.integer "celestialIndex"
    t.integer "orbitIndex"
    t.index ["constellationID"], name: "ix_mapDenormalize_constellationID"
    t.index ["groupID", "constellationID"], name: "mapDenormalize_IX_groupConstellation"
    t.index ["groupID", "regionID"], name: "mapDenormalize_IX_groupRegion"
    t.index ["groupID", "solarSystemID"], name: "mapDenormalize_IX_groupSystem"
    t.index ["orbitID"], name: "ix_mapDenormalize_orbitID"
    t.index ["regionID"], name: "ix_mapDenormalize_regionID"
    t.index ["solarSystemID"], name: "ix_mapDenormalize_solarSystemID"
    t.index ["typeID"], name: "ix_mapDenormalize_typeID"
  end

  create_table "mapJumps", primary_key: "stargateID", id: :integer, default: nil, force: :cascade do |t|
    t.integer "destinationID"
  end

  create_table "mapLandmarks", primary_key: "landmarkID", id: :integer, default: nil, force: :cascade do |t|
    t.string "landmarkName", limit: 100
    t.text "description"
    t.integer "locationID"
    t.float "x"
    t.float "y"
    t.float "z"
    t.integer "iconID"
  end

  create_table "mapLocationScenes", primary_key: "locationID", id: :integer, default: nil, force: :cascade do |t|
    t.integer "graphicID"
  end

  create_table "mapLocationWormholeClasses", primary_key: "locationID", id: :integer, default: nil, force: :cascade do |t|
    t.integer "wormholeClassID"
  end

  create_table "mapRegionJumps", primary_key: ["fromRegionID", "toRegionID"], force: :cascade do |t|
    t.integer "fromRegionID", null: false
    t.integer "toRegionID", null: false
  end

  create_table "mapRegions", primary_key: "regionID", id: :integer, default: nil, force: :cascade do |t|
    t.string "regionName", limit: 100
    t.float "x"
    t.float "y"
    t.float "z"
    t.float "xMin"
    t.float "xMax"
    t.float "yMin"
    t.float "yMax"
    t.float "zMin"
    t.float "zMax"
    t.integer "factionID"
    t.float "radius"
  end

  create_table "mapSolarSystemJumps", primary_key: ["fromSolarSystemID", "toSolarSystemID"], force: :cascade do |t|
    t.integer "fromRegionID"
    t.integer "fromConstellationID"
    t.integer "fromSolarSystemID", null: false
    t.integer "toSolarSystemID", null: false
    t.integer "toConstellationID"
    t.integer "toRegionID"
  end

  create_table "mapSolarSystems", primary_key: "solarSystemID", id: :integer, default: nil, force: :cascade do |t|
    t.integer "regionID"
    t.integer "constellationID"
    t.string "solarSystemName", limit: 100
    t.float "x"
    t.float "y"
    t.float "z"
    t.float "xMin"
    t.float "xMax"
    t.float "yMin"
    t.float "yMax"
    t.float "zMin"
    t.float "zMax"
    t.float "luminosity"
    t.boolean "border"
    t.boolean "fringe"
    t.boolean "corridor"
    t.boolean "hub"
    t.boolean "international"
    t.boolean "regional"
    t.boolean "constellation"
    t.float "security"
    t.integer "factionID"
    t.float "radius"
    t.integer "sunTypeID"
    t.string "securityClass", limit: 2
    t.index ["constellationID"], name: "ix_mapSolarSystems_constellationID"
    t.index ["regionID"], name: "ix_mapSolarSystems_regionID"
    t.index ["security"], name: "ix_mapSolarSystems_security"
  end

  create_table "mapUniverse", primary_key: "universeID", id: :integer, default: nil, force: :cascade do |t|
    t.string "universeName", limit: 100
    t.float "x"
    t.float "y"
    t.float "z"
    t.float "xMin"
    t.float "xMax"
    t.float "yMin"
    t.float "yMax"
    t.float "zMin"
    t.float "zMax"
    t.float "radius"
  end

  create_table "npc_corp_divisions", primary_key: ["corporation_id", "division"], force: :cascade do |t|
    t.integer "corporation_id", null: false
    t.integer "division", null: false
    t.integer "size"
  end

  create_table "npc_corp_research", primary_key: ["skill_type_id", "corporation_id"], force: :cascade do |t|
    t.integer "skill_type_id", null: false
    t.integer "corporation_id", null: false
    t.index ["corporation_id"], name: "index_npc_corp_research_on_corporation_id"
    t.index ["skill_type_id"], name: "index_npc_corp_research_on_skill_type_id"
  end

  create_table "planetSchematics", primary_key: "schematicID", id: :integer, default: nil, force: :cascade do |t|
    t.string "schematicName", limit: 255
    t.integer "cycleTime"
  end

  create_table "planetSchematicsPinMap", primary_key: ["schematicID", "pinTypeID"], force: :cascade do |t|
    t.integer "schematicID", null: false
    t.integer "pinTypeID", null: false
  end

  create_table "planetSchematicsTypeMap", primary_key: ["schematicID", "typeID"], force: :cascade do |t|
    t.integer "schematicID", null: false
    t.integer "typeID", null: false
    t.integer "quantity"
    t.boolean "isInput"
  end

  create_table "races", primary_key: "race_id", id: :integer, default: nil, force: :cascade do |t|
    t.string "name", limit: 100
    t.string "description", limit: 1000
    t.integer "icon_id"
    t.string "short_description", limit: 500
  end

  create_table "ramActivities", primary_key: "activityID", id: :integer, default: nil, force: :cascade do |t|
    t.string "activityName", limit: 100
    t.string "iconNo", limit: 5
    t.string "description", limit: 1000
    t.boolean "published"
  end

  create_table "ramAssemblyLineStations", primary_key: ["stationID", "assemblyLineTypeID"], force: :cascade do |t|
    t.integer "stationID", null: false
    t.integer "assemblyLineTypeID", null: false
    t.integer "quantity"
    t.integer "stationTypeID"
    t.integer "ownerID"
    t.integer "solarSystemID"
    t.integer "regionID"
    t.index ["ownerID"], name: "ix_ramAssemblyLineStations_ownerID"
    t.index ["regionID"], name: "ix_ramAssemblyLineStations_regionID"
    t.index ["solarSystemID"], name: "ix_ramAssemblyLineStations_solarSystemID"
  end

  create_table "ramAssemblyLineTypeDetailPerCategory", primary_key: ["assemblyLineTypeID", "categoryID"], force: :cascade do |t|
    t.integer "assemblyLineTypeID", null: false
    t.integer "categoryID", null: false
    t.float "timeMultiplier"
    t.float "materialMultiplier"
    t.float "costMultiplier"
  end

  create_table "ramAssemblyLineTypeDetailPerGroup", primary_key: ["assemblyLineTypeID", "groupID"], force: :cascade do |t|
    t.integer "assemblyLineTypeID", null: false
    t.integer "groupID", null: false
    t.float "timeMultiplier"
    t.float "materialMultiplier"
    t.float "costMultiplier"
  end

  create_table "ramAssemblyLineTypes", primary_key: "assemblyLineTypeID", id: :integer, default: nil, force: :cascade do |t|
    t.string "assemblyLineTypeName", limit: 100
    t.string "description", limit: 1000
    t.float "baseTimeMultiplier"
    t.float "baseMaterialMultiplier"
    t.float "baseCostMultiplier"
    t.float "volume"
    t.integer "activityID"
    t.float "minCostPerHour"
  end

  create_table "ramInstallationTypeContents", primary_key: ["installationTypeID", "assemblyLineTypeID"], force: :cascade do |t|
    t.integer "installationTypeID", null: false
    t.integer "assemblyLineTypeID", null: false
    t.integer "quantity"
  end

  create_table "research_agent_skills", primary_key: ["agent_id", "skill_type_id"], force: :cascade do |t|
    t.integer "agent_id", null: false
    t.integer "skill_type_id", null: false
    t.index ["agent_id"], name: "index_research_agent_skills_on_agent_id"
    t.index ["skill_type_id"], name: "ix_agtResearchAgents_typeID"
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

  create_table "warCombatZoneSystems", primary_key: "solarSystemID", id: :integer, default: nil, force: :cascade do |t|
    t.integer "combatZoneID"
  end

  create_table "warCombatZones", primary_key: "combatZoneID", id: :integer, default: nil, force: :cascade do |t|
    t.string "combatZoneName", limit: 100
    t.integer "factionID"
    t.integer "centerSystemID"
    t.string "description", limit: 500
  end

  add_foreign_key "agents", "corp_division_details", column: "division", primary_key: "division_id"
  add_foreign_key "ancestries", "bloodlines", primary_key: "bloodline_id"
  add_foreign_key "bloodlines", "races", primary_key: "race_id"
  add_foreign_key "corporations", "corporations", column: "enemy_id", primary_key: "corporation_id"
  add_foreign_key "corporations", "corporations", column: "friend_id", primary_key: "corporation_id"
  add_foreign_key "corporations", "factions", primary_key: "faction_id"
  add_foreign_key "dogma_attributes", "dogma_attribute_categories", column: "category_id", primary_key: "category_id"
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
  add_foreign_key "factions", "races", primary_key: "race_id"
  add_foreign_key "npc_corp_divisions", "corp_division_details", column: "division", primary_key: "division_id"
  add_foreign_key "npc_corp_divisions", "corporations", primary_key: "corporation_id"
  add_foreign_key "npc_corp_research", "corporations", primary_key: "corporation_id"
  add_foreign_key "research_agent_skills", "agents", primary_key: "agent_id"
end
