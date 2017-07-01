# This migration is a consolidated version of the migrations found in
# db/conversion/migrate. Assuming there have been no changes to the structure
# of CCP's Static Data Export (SDE) since the last time this migration was
# consolidated, this migration will convert a database instance of the SDE into
# the format necessary to use Sanctus.

# This migration makes use of the migration-data gem to generate the initial
# contents of certain columns.
class ConvertStaticDataExport < ActiveRecord::Migration[5.1]
  class Agent < ActiveRecord::Base
  end

  class BonusTrait < ActiveRecord::Base
  end

  class CertificateSkill < ActiveRecord::Base
  end
  
  class Corporation < ActiveRecord::Base
  end

  class DogmaAttribute < ActiveRecord::Base
  end

  class DogmaEffect < ActiveRecord::Base
  end
  
  class Faction < ActiveRecord::Base
  end

  class IndustryActivity < ActiveRecord::Base
  end

  class Item < ActiveRecord::Base
  end

  class ItemCategory < ActiveRecord::Base
  end

  class ItemGroup < ActiveRecord::Base
  end

  class MarketGroup < ActiveRecord::Base
  end

  class SolarSystem < ActiveRecord::Base
  end

  class UniverseItem < ActiveRecord::Base
  end

  class WormholeSystemClass < ActiveRecord::Base
  end
  
  def change
    # Drop unnecessary tables
    drop_table :agtAgentTypes do |t|
      t.integer :agentTypeID, null: false, index: { unique: true }
      t.string  :agentType,   limit: 50
    end

    drop_table :crpActivities do |t|
      t.integer :activityID,   null: false, index: { unique: true }
      t.string  :activityName, limit: 100
      t.string  :description,  limit: 1000
    end

    drop_table :industryActivityRaces, id: false do |t|
      t.integer :typeID,        index: { name: 'ix_industryActivityRaces_typeID'}
      t.integer :activityID
      t.integer :productTypeID, index: { name: 'ix_industryActivityRaces_productTypeID'}
      t.integer :raceID
    end

    drop_table :invControlTowerResourcePurposes do |t|
      t.integer :purpose,     null: false, index: { unique: true }
      t.string  :purposeText, limit: 100
    end

    drop_table :translationTables do |t|
      t.string  :sourceTable,      limit: 200
      t.string  :destinationTable, limit: 200
      t.string  :translatedKey,    limit: 200
      t.integer :tcGroupID
      t.integer :tcID
    end

    drop_table :trnTranslationColumns do |t|
      t.integer :tcID,       null: false, index: { unique: true }
      t.string  :tableName,  limit: 256
      t.string  :columnName, limit: 128
      t.string  :masterID,   limit: 128
    end

    drop_table :trnTranslations do |t|
      t.integer :tcID
      t.integer :keyID
      t.string  :languageID, limit: 50
      t.text    :text
    end

    drop_table :warCombatZones do |t|
      t.integer :combatZoneID,   null: false, index: { unique: true }
      t.string  :combatZoneName, limit: 100
      t.integer :factionID
      t.integer :centerSystemID
      t.string  :description,    limit: 500
    end
    
    # Alter remaining tables to support models
    rename_table :agtAgents, :agents
    change_table :agents do |t|
      t.rename :agentID, :agent_id
      t.rename :divisionID, :division
      t.index  :division
      t.rename :corporationID, :corporation_id
      t.rename :agentTypeID, :agent_type
      t.index  :agent_type
      t.rename :locationID, :location_id
      t.remove_index name: 'ix_agtAgents_locationID'
      t.string :location_type
      t.index [:location_type, :location_id]
    end
    remove_column :agents, :quality, :integer, default: 20
    
    rename_table :agtResearchAgents, :research_agent_skills
    change_table :research_agent_skills do |t|
      t.rename :agentID, :agent_id
      t.rename :typeID, :skill_type_id
      t.index  :agent_id
    end

    rename_table :certCerts, :certificates
    change_table :certificates do |t|
      t.rename :certID, :cert_id
      t.rename :groupID, :group_id
      t.index  :group_id
    end

    rename_table :certMasteries, :certificate_masteries
    change_table :certificate_masteries do |t|
      t.rename :typeID, :type_id
      t.index  :type_id
      t.rename :masteryLevel, :mastery_level
      t.rename :certID, :cert_id
      t.index  :cert_id
    end

    rename_table :certSkills, :certificate_skills
    change_table :certificate_skills do |t|
      t.rename :certID, :cert_id
      t.index :cert_id
      t.rename :skillID, :skill_id
      t.rename :certLevelInt, :certificate_level
      t.rename :skillLevel, :skill_level
    end

    rename_table :chrAncestries, :ancestries
    change_table :ancestries do |t|
      t.rename :ancestryID, :ancestry_id
      t.rename :ancestryName, :name
      t.rename :bloodlineID, :bloodline_id
      t.index :bloodline_id
      t.rename :iconID, :icon_id
      t.index :icon_id
      t.rename :shortDescription, :short_description
    end

    rename_table :chrAttributes, :training_attributes
    change_table :training_attributes do |t|
      t.rename :attributeID, :attribute_id
      t.rename :attributeName, :name
      t.rename :iconID, :icon_id
      t.index :icon_id
      t.rename :shortDescription, :short_description
    end

    rename_table :chrBloodlines, :bloodlines
    change_table :bloodlines do |t|
      t.rename :bloodlineID, :bloodline_id
      t.rename :bloodlineName, :name
      t.rename :raceID, :race_id
      t.index :race_id
      t.rename :maleDescription, :male_description
      t.rename :femaleDescription, :female_description
      t.rename :shipTypeID, :ship_type_id
      t.index :ship_type_id
      t.rename :corporationID, :corporation_id
      t.index :corporation_id
      t.rename :iconID, :icon_id
      t.index :icon_id
      t.rename :shortDescription, :short_description
      t.rename :shortMaleDescription, :short_male_description
      t.rename :shortFemaleDescription, :short_female_description
    end

    rename_table :chrFactions, :factions
    change_table :factions do |t|
      t.rename :factionID, :faction_id
      t.rename :factionName, :name
      t.rename :raceIDs, :race_id
      t.index :race_id
      t.rename :solarSystemID, :solar_system_id
      t.index :solar_system_id
      t.rename :corporationID, :corporation_id
      t.rename :sizeFactor, :size_factor
      t.rename :stationCount, :station_count
      t.rename :stationSystemCount, :station_system_count
      t.rename :militiaCorporationID, :militia_corporation_id
      t.index :militia_corporation_id
      t.rename :iconID, :icon_id
      t.index :icon_id
      t.integer :uniqueness, null: false, default: 1
      t.index :uniqueness
    end

    rename_table :chrRaces, :races
    change_table :races do |t|
      t.rename :raceID, :race_id
      t.rename :raceName, :name
      t.rename :iconID, :icon_id
      t.index :icon_id
      t.rename :shortDescription, :short_description
    end

    rename_table :crpNPCCorporations, :corporations
    change_table :corporations do |t|
      t.rename :corporationID, :corporation_id
      t.rename :solarSystemID, :solar_system_id
      t.index :solar_system_id
      t.rename :friendID, :friend_id
      t.index :friend_id
      t.rename :enemyID, :enemy_id
      t.index :enemy_id
      t.rename :factionID, :faction_id
      t.index :faction_id
      t.rename :stationCount, :station_count
      t.rename :stationSystemCount, :station_system_count
      t.rename :iconID, :icon_id
      t.index :icon_id
      t.belongs_to :ceo, index: true
      t.decimal :tax_rate, :decimal, precision: 4, scale: 3
      t.string :ticker, limit: 5
      t.string :name
      t.belongs_to :creator, index: true
      t.belongs_to :alliance, index: true
      t.datetime :creation_date
      t.integer :member_count
      t.string :url
      t.integer :deletion_status, null: false, default: 0, index: true
      t.string :icon_64
      t.string :icon_128
      t.string :icon_256
      t.integer :corporation_type, null: false, default: 2, index: true
      t.timestamps null: true
    end
    remove_column :corporations, :size, :string, limit: 1
    remove_column :corporations, :extent, :string, limit: 1
    remove_column :corporations, :investorID1, :integer
    remove_column :corporations, :investorShares1, :integer
    remove_column :corporations, :investorID2, :integer
    remove_column :corporations, :investorShares2, :integer
    remove_column :corporations, :investorID3, :integer
    remove_column :corporations, :investorShares3, :integer
    remove_column :corporations, :investorID4, :integer
    remove_column :corporations, :investorShares4, :integer
    remove_column :corporations, :publicShares, :integer
    remove_column :corporations, :initialPrice, :integer
    remove_column :corporations, :minSecurity, :float
    remove_column :corporations, :scattered, :boolean
    remove_column :corporations, :fringe, :integer
    remove_column :corporations, :corridor, :integer
    remove_column :corporations, :hub, :integer
    remove_column :corporations, :border, :integer
    remove_column :corporations, :sizeFactor, :float

    rename_table :crpNPCCorporationDivisions, :npc_corp_divisions
    change_table :npc_corp_divisions do |t|
      t.rename :corporationID, :corporation_id
      t.index :corporation_id
      t.rename :divisionID, :division
      t.index :division
    end

    rename_table :crpNPCCorporationResearchFields, :npc_corp_research
    change_table :npc_corp_research do |t|
      t.rename :corporationID, :corporation_id
      t.index :corporation_id
      t.rename :skillID, :skill_type_id
      t.index :skill_type_id
    end

    rename_table :crpNPCCorporationTrades, :npc_corp_item_offers
    change_table :npc_corp_item_offers do |t|
      t.rename :corporationID, :corporation_id
      t.index :corporation_id
      t.rename :typeID, :type_id
      t.index :type_id
    end

    rename_table :crpNPCDivisions, :corp_division_details
    change_table :corp_division_details do |t|
      t.rename :divisionID, :division_id
      t.rename :divisionName, :name
      t.rename :leaderType, :leader_title
    end

    rename_table :dgmAttributeCategories, :dogma_attribute_categories
    change_table :dogma_attribute_categories do |t|
      t.rename :categoryID, :category_id
      t.rename :categoryName, :name
      t.rename :categoryDescription, :description
    end

    rename_table :dgmAttributeTypes, :dogma_attributes
    change_table :dogma_attributes do |t|
      t.rename :attributeID, :attribute_id
      t.rename :attributeName, :name
      t.rename :iconID, :icon_id
      t.index :icon_id
      t.rename :defaultValue, :default_value
      t.rename :displayName, :display_name
      t.rename :unitID, :unit_id
      t.index :unit_id
      t.rename :categoryID, :category_id
      t.index :category_id
    end

    rename_table :dgmEffects, :dogma_effects
    change_table :dogma_effects do |t|
      t.rename :effectID, :effect_id
      t.rename :effectName, :name
      t.rename :displayName, :display_name
      t.rename :effectCategory, :effect_category
      t.rename :preExpression, :pre_expression
      t.index :pre_expression
      t.rename :postExpression, :post_expression
      t.index :post_expression
      t.rename :iconID, :icon_id
      t.index :icon_id
      t.rename :isOffensive, :offensive
      t.rename :isAssistance, :assistance
      t.rename :durationAttributeID, :duration_attribute_id
      t.index :duration_attribute_id
      t.rename :trackingSpeedAttributeID, :tracking_speed_attribute_id
      t.index :tracking_speed_attribute_id
      t.rename :dischargeAttributeID, :discharge_attribute_id
      t.index :discharge_attribute_id
      t.rename :rangeAttributeID, :range_attribute_id
      t.index :range_attribute_id
      t.rename :falloffAttributeID, :falloff_attribute_id
      t.index :falloff_attribute_id
      t.rename :rangeChance, :range_chance
      t.rename :electronicChance, :electronic_chance
      t.rename :propulsionChance, :propulsion_chance
      t.rename :sfxName, :sfx_name
      t.rename :npcUsageChanceAttributeID, :npc_usage_chance_attribute_id
      t.index :npc_usage_chance_attribute_id, name: 'npc_usage_change_index'
      t.rename :npcActivationChanceAttributeID, :npc_activation_chance_attribute_id
      t.index :npc_activation_chance_attribute_id, name: 'npc_activation_chance_index'
      t.rename :fittingUsageChanceAttributeID, :fitting_usage_chance_attribute_id
      t.index :fitting_usage_chance_attribute_id, name: 'fitting_usage_chance_index'
      t.rename :modifierInfo, :modifier_info
      t.index :guid
    end

    rename_table :dgmExpressions, :dogma_expressions
    change_table :dogma_expressions do |t|
      t.rename :expressionID, :expression_id
      t.rename :operandID, :operand_id
      t.rename :expressionValue, :value
      t.rename :expressionName, :name
      t.rename :expressionTypeID, :type_id
      t.index :type_id
      t.rename :expressionGroupID, :item_group_id
      t.index :item_group_id
      t.rename :expressionAttributeID, :attribute_id
      t.index :attribute_id
    end

    rename_table :dgmTypeAttributes, :dogma_attribute_values
    change_table :dogma_attribute_values do |t|
      t.rename :typeID, :type_id
      t.index :type_id
      t.rename :attributeID, :attribute_id
      t.rename :valueInt, :value_integer
      t.rename :valueFloat, :value_float
    end

    rename_table :dgmTypeEffects, :dogma_effect_defaults
    change_table :dogma_effect_defaults do |t|
      t.rename :typeID, :type_id
      t.index :type_id
      t.rename :effectID, :effect_id
      t.index :effect_id
      t.rename :isDefault, :default
    end

    rename_table :eveGraphics, :graphics
    change_table :graphics do |t|
      t.rename :graphicID, :graphic_id
      t.rename :sofFactionName, :sof_faction_name
      t.rename :graphicFile, :graphic_file
      t.rename :sofHullName, :sof_hull_name
      t.rename :sofRaceName, :sof_race_name
    end

    rename_table :eveIcons, :icons
    change_table :icons do |t|
      t.rename :iconID, :icon_id
      t.rename :iconFile, :icon_file
    end

    rename_table :eveUnits, :units
    change_table :units do |t|
      t.rename :unitID, :unit_id
      t.rename :unitName, :name
      t.rename :displayName, :display_name
    end

    rename_table :industryActivity, :industry_times
    change_table :industry_times do |t|
      t.rename :typeID, :blueprint_id
      t.index :blueprint_id
      t.rename :activityID, :activity_type
    end

    rename_table :industryActivityMaterials, :blueprint_materials
    change_table :blueprint_materials do |t|
      t.rename :typeID, :blueprint_id
      t.rename :activityID, :activity_type
      t.index :activity_type
      t.rename :materialTypeID, :material_type_id
      t.index :material_type_id
      t.index [:blueprint_id, :material_type_id]
    end

    rename_table :industryActivityProbabilities, :industry_probabilities
    change_table :industry_probabilities do |t|
      t.rename :typeID, :blueprint_id
      t.rename :activityID, :activity_type
      t.index :activity_type
      t.rename :productTypeID, :product_type_id
    end

    rename_table :industryActivityProducts, :blueprint_products
    change_table :blueprint_products do |t|
      t.rename :typeID, :blueprint_id
      t.rename :activityID, :activity_type
      t.index :activity_type
      t.rename :productTypeID, :product_type_id
      t.index [:blueprint_id, :product_type_id], name: 'blueprint_product_type_id_product_index'
    end

    rename_table :industryActivitySkills, :blueprint_skills
    change_table :blueprint_skills do |t|
      t.rename :typeID, :blueprint_id
      t.rename :activityID, :activity_type
      t.index :activity_type
      t.rename :skillID, :skill_id
      t.rename :level, :required_level
      t.index [:blueprint_id, :skill_id]
    end

    rename_table :industryBlueprints, :blueprint_production_limits
    change_table :blueprint_production_limits do |t|
      t.rename :typeID, :blueprint_id
      t.rename :maxProductionLimit, :max_production
    end

    rename_table :invCategories, :item_categories
    change_table :item_categories do |t|
      t.rename :categoryID, :category_id
      t.rename :categoryName, :name
      t.rename :iconID, :icon_id
      t.index :icon_id
    end

    rename_table :invContrabandTypes, :contraband
    change_table :contraband do |t|
      t.rename :factionID, :faction_id
      t.index :faction_id
      t.rename :typeID, :type_id
      t.rename :standingLoss, :standing_loss
      t.rename :confiscateMinSec, :confiscate
      t.rename :fineByValue, :fine_by_value
      t.rename :attackMinSec, :attack
    end

    rename_table :invControlTowerResources, :tower_resources
    change_table :tower_resources do |t|
      t.rename :controlTowerTypeID, :tower_type_id
      t.rename :resourceTypeID, :resource_type_id
      t.rename :minSecurityLevel, :min_security_level
      t.rename :factionID, :faction_id
      t.index :faction_id
      t.index :tower_type_id
      t.index :resource_type_id
    end

    rename_table :invFlags, :inventory_flags
    change_table :inventory_flags do |t|
      t.rename :flagID, :flag_id
      t.rename :flagName, :name
      t.rename :flagText, :description
      t.rename :orderID, :order_id
    end

    rename_table :invGroups, :item_groups
    change_table :item_groups do |t|
      t.rename :groupID, :group_id
      t.rename :categoryID, :category_id
      t.rename :groupName, :name
      t.rename :iconID, :icon_id
      t.index :icon_id
      t.rename :useBasePrice, :base_price
      t.rename :fittableNonSingleton, :fit_multiple
    end

    rename_table :invItems, :universe_items
    change_table :universe_items do |t|
      t.rename :itemID, :item_id
      t.rename :typeID, :type_id
      t.index :type_id
      t.rename :ownerID, :owner_id
      t.index :owner_id
      t.rename :locationID, :location_id
      t.rename :flagID, :flag_id
      t.index :flag_id
      t.string :owner_type, default: 'UniverseEntity'
      t.index [:owner_type, :owner_id]
    end

    rename_table :invMarketGroups, :market_groups
    change_table :market_groups do |t|
      t.rename :marketGroupID, :market_group_id
      t.rename :parentGroupID, :parent_group_id
      t.index :parent_group_id
      t.rename :marketGroupName, :name
      t.rename :iconID, :icon_id
      t.index :icon_id
    end

    rename_table :invMetaGroups, :meta_item_groups
    change_table :meta_item_groups do |t|
      t.rename :metaGroupID, :meta_group_id
      t.rename :metaGroupName, :name
      t.rename :iconID, :icon_id
      t.index :icon_id
    end

    rename_table :invMetaTypes, :meta_variations
    change_table :meta_variations do |t|
      t.rename :typeID, :meta_type_id
      t.rename :parentTypeID, :base_type_id
      t.index :base_type_id
      t.rename :metaGroupID, :meta_group_id
      t.index :meta_group_id
    end

    rename_table :invNames, :universe_entities
    change_table :universe_entities do |t|
      t.rename :itemID, :item_id
      t.rename :itemName, :name
    end

    rename_table :invPositions, :universe_positions
    change_table :universe_positions do |t|
      t.rename :itemID, :item_id
    end

    rename_table :invTraits, :bonus_traits
    change_table :bonus_traits do |t|
      t.rename :traitID, :trait_id
      t.rename :typeID, :type_id
      t.index :type_id
      t.rename :skillID, :skill_id
      t.index :skill_id
      t.rename :bonusText, :description
      t.rename :unitID, :unit_id
      t.index :unit_id
    end

    rename_table :invTypes, :items
    change_table :items do |t|
      t.rename :typeID, :type_id
      t.rename :groupID, :group_id
      t.rename :typeName, :name
      t.rename :portionSize, :portion_size
      t.rename :raceID, :race_id
      t.index :race_id
      t.rename :basePrice, :base_price
      t.rename :marketGroupID, :market_group_id
      t.index :market_group_id
      t.rename :iconID, :icon_id
      t.rename :soundID, :sound_id
      t.rename :graphicID, :graphic_id
      t.index :graphic_id
      t.string :type
    end

    rename_table :invTypeMaterials, :item_materials
    change_table :item_materials do |t|
      t.rename :typeID, :type_id
      t.index :type_id
      t.rename :materialTypeID, :material_type_id
      t.index :material_type_id
    end

    rename_table :invTypeReactions, :industry_reactions
    change_table :industry_reactions do |t|
      t.rename :reactionTypeID, :reaction_type_id
      t.index :reaction_type_id
      t.rename :typeID, :reagent_id
      t.index :reagent_id
    end

    rename_table :invUniqueNames, :universe_unique_names
    change_table :universe_unique_names do |t|
      t.rename :itemID, :item_id
      t.rename :itemName, :name
      t.rename :groupID, :group_id
    end

    rename_table :invVolumes, :item_volumes
    change_table :item_volumes do |t|
      t.rename :typeID, :type_id
    end

    rename_table :mapCelestialStatistics, :celestial_details
    change_table :celestial_details do |t|
      t.rename :celestialID, :celestial_id
      t.rename :spectralClass, :spectral_class
      t.rename :orbitRadius, :orbit_radius
      t.rename :massDust, :mass_dust
      t.rename :massGas, :mass_gas
      t.rename :surfaceGravity, :surface_gravity
      t.rename :escapeVelocity, :escape_velocity
      t.rename :orbitPeriod, :orbit_period
      t.rename :rotationRate, :rotation_rate
    end

    rename_table :mapDenormalize, :denormalized_map
    change_table :denormalized_map do |t|
      t.rename :itemID, :item_id
      t.rename :typeID, :type_id
      t.rename :groupID, :group_id
      t.index :group_id
      t.rename :solarSystemID, :solar_system_id
      t.rename :constellationID, :constellation_id
      t.rename :regionID, :region_id
      t.rename :orbitID, :orbit_id
      t.rename :itemName, :name
      t.rename :celestialIndex, :celestial_index
      t.rename :orbitIndex, :orbit_index
    end

    rename_table :mapConstellationJumps, :constellation_connections
    change_table :constellation_connections do |t|
      t.rename :fromConstellationID, :from_constellation_id
      t.index :from_constellation_id
      t.rename :toConstellationID, :to_constellation_id
      t.index :to_constellation_id
      t.index [:to_constellation_id, :from_constellation_id], name: 'to_from_constellation_id_index'
    end
    remove_column :constellation_connections, :fromRegionID, :integer
    remove_column :constellation_connections, :toRegionID, :integer

    rename_table :mapConstellations, :constellations
    change_table :constellations do |t|
      t.rename :constellationID, :constellation_id
      t.rename :regionID, :region_id
      t.index :region_id
      t.rename :constellationName, :name
      t.rename :xMin, :x_min
      t.rename :xMax, :x_max
      t.rename :yMin, :y_min
      t.rename :yMax, :y_max
      t.rename :zMin, :z_min
      t.rename :zMax, :z_max
      t.rename :factionID, :faction_id
      t.index :faction_id
    end

    rename_table :mapJumps, :stargates
    change_table :stargates do |t|
      t.rename :stargateID, :stargate_id
      t.rename :destinationID, :destination_stargate_id
      t.index :destination_stargate_id
      t.belongs_to :destination_system, index: true
      t.belongs_to :solar_system, index: true
      t.belongs_to :stargate_type, index: true
      t.string :name
      t.float :x
      t.float :y
      t.float :z
    end

    rename_table :mapLandmarks, :landmarks
    change_table :landmarks do |t|
      t.rename :landmarkID, :landmark_id
      t.rename :landmarkName, :name
      t.rename :locationID, :solar_system_id
      t.index :solar_system_id
      t.rename :iconID, :icon_id
      t.index :icon_id
    end

    rename_table :mapLocationScenes, :region_scenes
    change_table :region_scenes do |t|
      t.rename :locationID, :region_id
      t.rename :graphicID, :graphic_id
      t.index :graphic_id
    end

    rename_table :mapLocationWormholeClasses, :wormhole_system_classes
    change_table :wormhole_system_classes do |t|
      t.rename :locationID, :location_id
      t.rename :wormholeClassID, :class_id
      t.index :class_id
    end

    rename_table :mapRegionJumps, :region_connections
    change_table :region_connections do |t|
      t.rename :fromRegionID, :from_region_id
      t.index :from_region_id
      t.rename :toRegionID, :to_region_id
      t.index :to_region_id
      t.index [:to_region_id, :from_region_id]
    end

    rename_table :mapRegions, :regions
    change_table :regions do |t|
      t.rename :regionID, :region_id
      t.rename :regionName, :name
      t.rename :xMin, :x_min
      t.rename :xMax, :x_max
      t.rename :yMin, :y_min
      t.rename :yMax, :y_max
      t.rename :zMin, :z_min
      t.rename :zMax, :z_max
      t.rename :factionID, :faction_id
      t.index :faction_id
    end

    rename_table :mapSolarSystemJumps, :system_connections
    change_table :system_connections do |t|
      t.rename :fromSolarSystemID, :from_system_id
      t.index :from_system_id
      t.rename :toSolarSystemID, :to_system_id
      t.index :to_system_id
    end
    remove_column :system_connections, :fromRegionID, :integer
    remove_column :system_connections, :fromConstellationID, :integer
    remove_column :system_connections, :toConstellationID, :integer
    remove_column :system_connections, :toRegionID, :integer

    rename_table :mapSolarSystems, :solar_systems
    change_table :solar_systems do |t|
      t.rename :solarSystemID, :system_id
      t.rename :regionID, :region_id
      t.rename :constellationID, :constellation_id
      t.rename :solarSystemName, :name
      t.rename :xMin, :x_min
      t.rename :xMax, :x_max
      t.rename :yMin, :y_min
      t.rename :yMax, :y_max
      t.rename :zMin, :z_min
      t.rename :zMax, :z_max
      t.rename :security, :security_status
      t.rename :factionID, :faction_id
      t.index :faction_id
      t.rename :sunTypeID, :sun_type_id
      t.index :sun_type_id
      t.rename :securityClass, :security_class
      t.integer :jumps_last_hour
      t.datetime :last_jumps_check
      t.integer :npc_kills_last_hour
      t.integer :pod_kills_last_hour
      t.integer :ship_kills_last_hour
      t.datetime :last_kills_check
      t.belongs_to :corporation
      t.belongs_to :alliance
  
      t.timestamps null: true
    end

    rename_table :mapUniverse, :universes
    change_table :universes do |t|
      t.rename :universeID, :universe_id
      t.rename :universeName, :name
      t.rename :xMin, :x_min
      t.rename :xMax, :x_max
      t.rename :yMin, :y_min
      t.rename :yMax, :y_max
      t.rename :zMin, :z_min
      t.rename :zMax, :z_max
    end

    rename_table :planetSchematics, :schematics
    change_table :schematics do |t|
      t.rename :schematicID, :schematic_id
      t.rename :schematicName, :name
      t.rename :cycleTime, :cycle_time
    end

    rename_table :planetSchematicsPinMap, :pin_schematics
    change_table :pin_schematics do |t|
      t.rename :schematicID, :schematic_id
      t.index :schematic_id
      t.rename :pinTypeID, :pin_type_id
      t.index :pin_type_id
    end

    rename_table :planetSchematicsTypeMap, :schematic_materials
    change_table :schematic_materials do |t|
      t.rename :schematicID, :schematic_id
      t.index :schematic_id
      t.rename :typeID, :material_id
      t.index :material_id
      t.rename :isInput, :input
    end

    rename_table :ramActivities, :industry_activities
    change_table :industry_activities do |t|
      t.rename :activityID, :activity_id
      t.rename :activityName, :name
      t.rename :iconNo, :icon_number
    end

    rename_table :ramAssemblyLineStations, :industry_facilities
    change_table :industry_facilities do |t|
      t.rename :stationID, :facility_id
      t.index :facility_id
      t.rename :assemblyLineTypeID, :assembly_line_id
      t.index :assembly_line_id
      t.rename :stationTypeID, :station_type_id
      t.index :station_type_id
      t.rename :ownerID, :owner_id
      t.rename :solarSystemID, :solar_system_id
      t.rename :regionID, :region_id
      t.float :tax
    end

    rename_table :ramAssemblyLineTypeDetailPerCategory, :assembly_categories
    change_table :assembly_categories do |t|
      t.rename :assemblyLineTypeID, :assembly_line_id
      t.index :assembly_line_id
      t.rename :categoryID, :category_id
      t.index :category_id
      t.rename :timeMultiplier, :time_multiplier
      t.rename :materialMultiplier, :material_multiplier
      t.rename :costMultiplier, :cost_multiplier
    end

    rename_table :ramAssemblyLineTypeDetailPerGroup, :assembly_groups
    change_table :assembly_groups do |t|
      t.rename :assemblyLineTypeID, :assembly_line_id
      t.index :assembly_line_id
      t.rename :groupID, :group_id
      t.index :group_id
      t.rename :timeMultiplier, :time_multiplier
      t.rename :materialMultiplier, :material_multiplier
      t.rename :costMultiplier, :cost_multiplier
    end

    rename_table :ramAssemblyLineTypes, :assembly_lines
    change_table :assembly_lines do |t|
      t.rename :assemblyLineTypeID, :assembly_line_id
      t.rename :assemblyLineTypeName, :name
      t.rename :baseTimeMultiplier, :base_time_multiplier
      t.rename :baseMaterialMultiplier, :base_material_multiplier
      t.rename :baseCostMultiplier, :base_cost_multiplier
      t.rename :activityID, :activity_type
      t.index :activity_type
      t.rename :minCostPerHour, :min_cost_per_hour
    end

    rename_table :ramInstallationTypeContents, :industry_installations
    change_table :industry_installations do |t|
      t.rename :installationTypeID, :installation_type_id
      t.index :installation_type_id
      t.rename :assemblyLineTypeID, :assembly_line_id
      t.index :assembly_line_id
    end

    rename_table :skinLicense, :skin_licenses
    change_table :skin_licenses do |t|
      t.rename :licenseTypeID, :license_type_id
      t.rename :skinID, :skin_id
      t.index :skin_id
    end

    rename_table :skinMaterials, :skin_materials
    change_table :skin_materials do |t|
      t.rename :skinMaterialID, :skin_material_id
      t.rename :displayNameID, :display_name_id
      t.index :display_name_id
      t.rename :materialSetID, :material_set_id
      t.index :material_set_id
    end

    rename_table :skinShip, :skin_ships
    change_table :skin_ships do |t|
      t.rename :skinID, :skin_id
      t.rename :typeID, :type_id
    end

    change_table :skins do |t|
      t.rename :skinID, :skin_id
      t.rename :internalName, :internal_name
      t.rename :skinMaterialID, :skin_material_id
      t.index :skin_material_id
    end

    rename_table :staOperationServices, :operation_services
    change_table :operation_services do |t|
      t.rename :operationID, :operation_id
      t.index :operation_id
      t.rename :serviceID, :service_id
      t.index :service_id
    end

    rename_table :staOperations, :structure_operations
    change_table :structure_operations do |t|
      t.rename :operationID, :operation_id
      t.rename :activityID, :activity_type
      t.index :activity_type
      t.rename :operationName, :name
      t.rename :caldariStationTypeID, :caldari_station_type_id
      t.index :caldari_station_type_id, name: 'caldari_station_index'
      t.rename :minmatarStationTypeID, :minmatar_station_type_id
      t.index :minmatar_station_type_id, name: 'minmatar_station_index'
      t.rename :amarrStationTypeID, :amarr_station_type_id
      t.index :amarr_station_type_id, name: 'amarr_station_index'
      t.rename :gallenteStationTypeID, :gallente_station_type_id
      t.index :gallente_station_type_id, name: 'gallente_station_index'
      t.rename :joveStationTypeID, :jove_station_type_id
      t.index :jove_station_type_id, name: 'jove_station_index'
    end

    rename_table :staServices, :structure_services
    change_table :structure_services do |t|
      t.rename :serviceID, :service_id
      t.rename :serviceName, :name
    end

    rename_table :staStationTypes, :station_details
    change_table :station_details do |t|
      t.rename :stationTypeID, :station_type_id
      t.rename :dockEntryX, :dock_entry_x
      t.rename :dockEntryY, :dock_entry_y
      t.rename :dockEntryZ, :dock_entry_z
      t.rename :dockOrientationX, :dock_orientation_x
      t.rename :dockOrientationY, :dock_orientation_y
      t.rename :dockOrientationZ, :dock_orientation_z
      t.rename :operationID, :operation_id
      t.index :operation_id
      t.rename :officeSlots, :office_slots
      t.rename :reprocessingEfficiency, :reprocessing_efficiency
    end

    rename_table :staStations, :dockable_structures
    change_table :dockable_structures do |t|
      t.rename :stationID, :dockable_id
      t.rename :maxShipVolumeDockable, :max_ship_volume
      t.rename :officeRentalCost, :office_rental_cost
      t.rename :operationID, :operation_id
      t.rename :stationTypeID, :station_type_id
      t.rename :corporationID, :owner_id
      t.rename :solarSystemID, :solar_system_id
      t.rename :constellationID, :constellation_id
      t.rename :regionID, :region_id
      t.rename :stationName, :name
      t.rename :reprocessingEfficiency, :reprocessing_efficiency
      t.rename :reprocessingStationsTake, :reprocessing_take
      t.rename :reprocessingHangarFlag, :reprocessing_hangar_flag
      t.string :type
    end
    remove_column :dockable_structures, :dockingCostPerVolume, :float

    rename_table :trnTranslationLanguages, :languages
    change_table :languages do |t|
      t.rename :numericLanguageID, :numeric_language_id
      t.rename :languageID, :string_language_id
      t.rename :languageName, :name
    end

    rename_table :warCombatZoneSystems, :faction_warfare_systems
    change_table :faction_warfare_systems do |t|
      t.rename :solarSystemID, :system_id
      t.rename :combatZoneID, :combat_zone
    end
    
    # Add foreign keys
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
    add_foreign_key "celestial_details", "universe_items", column: "celestial_id", primary_key: "item_id"
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
    add_foreign_key "faction_warfare_systems", "solar_systems", column: "system_id", primary_key: "system_id"
    add_foreign_key "factions", "icons", primary_key: "icon_id"
    add_foreign_key "factions", "solar_systems", primary_key: "system_id"
    add_foreign_key "industry_facilities", "assembly_lines", primary_key: "assembly_line_id"
    add_foreign_key "industry_facilities", "corporations", column: "owner_id", primary_key: "corporation_id"
    add_foreign_key "industry_facilities", "items", column: "station_type_id", primary_key: "type_id"
    add_foreign_key "industry_facilities", "regions", primary_key: "region_id"
    add_foreign_key "industry_facilities", "solar_systems", primary_key: "system_id"
    add_foreign_key "industry_installations", "assembly_lines", primary_key: "assembly_line_id"
    add_foreign_key "industry_installations", "items", column: "installation_type_id", primary_key: "type_id"
    add_foreign_key "industry_probabilities", "industry_activities", column: "activity_type", primary_key: "activity_id"
    add_foreign_key "industry_reactions", "items", column: "reaction_type_id", primary_key: "type_id"
    add_foreign_key "industry_reactions", "items", column: "reagent_id", primary_key: "type_id"
    add_foreign_key "industry_times", "industry_activities", column: "activity_type", primary_key: "activity_id"
    add_foreign_key "item_categories", "icons", primary_key: "icon_id"
    add_foreign_key "item_groups", "icons", primary_key: "icon_id"
    add_foreign_key "item_groups", "item_categories", column: "category_id", primary_key: "category_id"
    add_foreign_key "item_materials", "items", column: "material_type_id", primary_key: "type_id"
    add_foreign_key "item_volumes", "items", column: "type_id", primary_key: "type_id"
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
    add_foreign_key "operation_services", "structure_operations", column: "operation_id", primary_key: "operation_id"
    add_foreign_key "operation_services", "structure_services", column: "service_id", primary_key: "service_id"
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
    add_foreign_key "skin_licenses", "items", column: "license_type_id", primary_key: "type_id"
    add_foreign_key "skin_licenses", "skins", primary_key: "skin_id"
    add_foreign_key "skin_ships", "items", column: "type_id", primary_key: "type_id"
    add_foreign_key "skin_ships", "skins", primary_key: "skin_id"
    add_foreign_key "skins", "skin_materials", primary_key: "skin_material_id"
    add_foreign_key "solar_systems", "constellations", primary_key: "constellation_id"
    add_foreign_key "solar_systems", "factions", primary_key: "faction_id"
    add_foreign_key "solar_systems", "items", column: "sun_type_id", primary_key: "type_id"
    add_foreign_key "solar_systems", "regions", primary_key: "region_id"
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
    
  end
  
  def data
    # agtAgents
    add_column :agents, :locator_agent, :integer, default: false
  
    Agent.reset_column_information
    Agent.where(isLocator: true).update_all(locator_agent: 1)
    Agent.where("location_id < ?", 40000000).update_all(location_type: 'SolarSystem')
    Agent.where("location_id > ?", 60000000).update_all(location_type: 'Station')
  
    remove_column :agents, :isLocator
    
    # certSkills
    add_column :certificate_skills, :level_name, :integer
    add_index :certificate_skills, :level_name

    CertificateSkill.reset_column_information
    CertificateSkill.where(certLevelText: 'basic').update_all(level_name: 0)
    CertificateSkill.where(certLevelText: 'standard').update_all(level_name: 1)
    CertificateSkill.where(certLevelText: 'improved').update_all(level_name: 2)
    CertificateSkill.where(certLevelText: 'advanced').update_all(level_name: 3)
    CertificateSkill.where(certLevelText: 'elite').update_all(level_name: 4)

    remove_column :certificate_skills, :certLevelText

    # chrFactions
    add_column :factions, :member_race, :integer, index: true

    Faction.reset_column_information
    Faction.update_all('member_race = race_id')
    Faction.where(race_id: [9, 15]).update_all(race_id: nil)
    Faction.where(militia_corporation_id: 0).update_all(militia_corporation_id: nil)

    add_foreign_key :factions, :races, primary_key: :race_id
    add_foreign_key :factions, :corporations, column: :militia_corporation_id,
                    primary_key: :corporation_id
    
    # crpNPCCorporations
    Corporation.reset_column_information
    Corporation.update_all(corporation_type: 1)
    Corporation.where(faction_id: 500021).update_all(faction_id: nil)
    
    # dgmAttributeTypes
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
    
    add_index :dogma_attributes, :data_export
    add_index :dogma_attributes, :stacking
    add_index :dogma_attributes, :good
    
    # dgmEffects
    change_table :dogma_effects do |t|
      t.integer :auto_repeat, null: false, default: 0, index: true
      t.integer :data_export, null: false, default: 1, index: true
      t.integer :warp_safety, null: false, default: 0, index: true
    end

    DogmaEffect.reset_column_information
    DogmaEffect.where(disallowAutoRepeat: true).update_all(auto_repeat: 1)
    DogmaEffect.where(published: false).update_all(data_export: 0)
    DogmaEffect.where(isWarpSafe: true).update_all(warp_safety: 1)

    change_table :dogma_effects do |t|
      t.remove :disallowAutoRepeat
      t.remove :published
      t.remove :isWarpSafe
    end

    add_index :dogma_effects, :auto_repeat
    add_index :dogma_effects, :data_export
    add_index :dogma_effects, :warp_safety
    
    # invCategories
    add_column :item_categories, :data_export, :integer, null: false, default: 1, index: true

    ItemCategory.reset_column_information
    ItemCategory.where(published: false).update_all(data_export: 0)

    remove_column :item_categories, :published
    add_index :item_categories, :data_export
    
    # invGroups
    add_column :item_groups, :data_export, :integer, null: false, default: 1, index: true

    ItemGroup.reset_column_information
    ItemGroup.where(published: false).update_all(data_export: 0)

    remove_column :item_groups, :published
    add_index :item_groups, :data_export

    # invItems
    add_column :universe_items, :location_type, :string

    UniverseItem.reset_column_information
    UniverseItem.where("location_id > ? and location_id < ?", 30000000, 40000000).update_all(location_type: 'SolarSystem')
    UniverseItem.where("location_id > ? and location_id < ?", 60000000, 70000000).update_all(location_type: 'Station')

    add_index :universe_items, [:location_type, :location_id]
    
    # invMarketGroups
    add_column :market_groups, :contents, :integer, null: false, default: 1, index: true

    MarketGroup.reset_column_information
    MarketGroup.where(hasTypes: false).update_all(contents: 0)

    remove_column :market_groups, :hasTypes
    
    # invTraits
    BonusTrait.reset_column_information
    BonusTrait.where(skill_id: -1).update_all(skill_id: nil)
    
    add_foreign_key :bonus_traits, :items, column: :skill_id, primary_key: :type_id
    
    # invTypes
    add_column :items, :data_export, :integer, null: false, default: 1, index: true

    Item.reset_column_information
    Item.where(published: false).update_all(data_export: 0)
    Item.where(graphic_id: 0).update_all(graphic_id: nil)

    remove_column :items, :published
    add_index :items, :data_export
    add_foreign_key :items, :graphics, primary_key: :graphic_id
    
    # mapLocationWormholeClasses
    add_column :wormhole_system_classes, :location_type, :string

    WormholeSystemClass.reset_column_information
    WormholeSystemClass.where("location_id > ? and location_id < ?", 10000000, 20000000).update_all(location_type: 'Region')
    WormholeSystemClass.where(location_id: [20000061, 20000062]).update_all(location_type: 'Constellation')
    WormholeSystemClass.where("location_id > ? and location_id < ?", 30000000, 40000000).update_all(location_type: 'SolarSystem')

    add_index :wormhole_system_classes, [:location_type, :location_id], name: 'wormhole_system_class_location_type_and_id'
    
    # mapSolarSystems
    change_table :solar_systems do |t|
      t.integer :topography, null: false, default: 3, index: true
      t.integer :links,      null: false, default: 1, index: true
    end

    SolarSystem.reset_column_information
    SolarSystem.where(fringe: true).update_all(topography: 1)
    SolarSystem.where(corridor: true).update_all(topography: 2)
    SolarSystem.where(regional: true).update_all(links: 3)

    change_table :solar_systems do |t|
      t.remove :fringe
      t.remove :corridor
      t.remove :hub
      t.remove :regional
      t.remove :constellation
    end
    
    # ramActivities
    add_column :industry_activities, :data_export, :integer, null: false,
                                                             default: 1,
                                                             index: true

    IndustryActivity.reset_column_information
    IndustryActivity.where(published: false).update_all(data_export: 0)

    remove_column :industry_activities, :published
    add_index :industry_activities, :data_export
    
  end
  
  def rollback
    # agtAgents
    add_column :agtAgents, :isLocator, :boolean, default: false
  
    Agent.reset_column_information
    Agent.where(locator_agent: 1).update_all(isLocator: true)
  
    remove_column :agtAgents, :locator_agent
    
    # certSkills
    remove_index :certSkills, :level_name
    add_column :certSkills, :certLevelText, :string

    CertificateSkill.reset_column_information
    CertificateSkill.where(level_name: 0).update_all(certLevelText: 'basic')
    CertificateSkill.where(level_name: 1).update_all(certLevelText: 'standard')
    CertificateSkill.where(level_name: 2).update_all(certLevelText: 'improved')
    CertificateSkill.where(level_name: 3).update_all(certLevelText: 'advanced')
    CertificateSkill.where(level_name: 4).update_all(certLevelText: 'elite')

    remove_column :certSkills, :level_name

    # chrFactions
    remove_foreign_key :factions, :races
    remove_foreign_key :factions, :corporations,

    Faction.reset_column_information
    Faction.update_all(race_id: :member_race)
    Faction.find(500024).update(militia_corporation_id: 0)

    remove_column :factions, :member_race
    
    # crpNPCCorporations
    Corporation.reset_column_information
    Corporation.find(1000193).update(faction_id: 500021)
    
    # dgmAttributeTypes
    remove_index :dgmAttributeTypes, :data_export
    remove_index :dgmAttributeTypes, :stacking
    remove_index :dgmAttributeTypes, :good
    
    change_table :dgmAttributeTypes do |t|
      t.boolean :published,  default: true
      t.boolean :stackable,  default: true
      t.boolean :highIsGood, default: true
    end

    DogmaAttribute.reset_column_information
    DogmaAttribute.where(data_export: 0).update_all(published: false)
    DogmaAttribute.where(stacking: 0).update_all(stackable: false)
    DogmaAttribute.where(good: 0).update_all(highIsGood: false)

    change_table :dgmAttributeTypes do |t|
      t.remove :data_export
      t.remove :stacking
      t.remove :good
    end
    
    # dgmEffects
    remove_index :dgmEffects, :auto_repeat
    remove_index :dgmEffects, :data_export
    remove_index :dgmEffects, :warp_safety
    
    change_table :dgmEffects do |t|
      t.boolean :disallowAutoRepeat, default: false
      t.boolean :published, default: true
      t.boolean :isWarpSafe, default: false
    end

    DogmaEffect.reset_column_information
    DogmaEffect.where(auto_repeat: 1).update_all(disallowAutoRepeat: true)
    DogmaEffect.where(data_export: 0).update_all(published: false)
    DogmaEffect.where(warp_safety: 1).update_all(isWarpSafe: true)

    change_table :dgmEffects do |t|
      t.remove :auto_repeat
      t.remove :data_export
      t.remove :warp_safety
    end
    
    # invCategories
    remove_index :invCategories, :data_export
    add_column :invCategories, :published, :boolean, null: false, default: true

    ItemCategory.reset_column_information
    ItemCategory.where(data_export: 0).update_all(published: false)

    remove_column :invCategories, :data_export
    
    # invGroups
    remove_index :invGroups, :data_export
    add_column :invGroups, :published, :boolean, null: false, default: true

    ItemGroup.reset_column_information
    ItemGroup.where(data_export: 0).update_all(published: false)

    remove_column :invGroups, :data_export
    
    # invItems
    remove_index :invItems, [:location_type, :location_id]
    remove_column :invItems, :location_type
    
    # invMarketGroups
    add_column :invMarketGroups, :hasTypes, :boolean, default: true

    MarketGroup.reset_column_information
    MarketGroup.where(contents: 0).update_all(hasTypes: false)

    remove_column :invMarketGroups, :contents
    
    # invTraits
    remove_foreign_key :bonus_traits, :items

    BonusTrait.reset_column_information
    BonusTrait.where(skill_id: nil).update_all(skill_id: -1)
    
    # invTypes
    add_column :invTypes, :published, :boolean, null: false, default: true
    remove_index :invTypes, :data_export
    remove_foreign_key :items, :eveGraphics

    Item.reset_column_information
    Item.where(data_export: 0).update_all(published: false)
    Item.where(graphic_id: nil).update_all(graphic_id: 0)

    remove_column :invTypes, :data_export
    
    # mapLocationWormholeClasses
    remove_index :mapLocationWormholeClasses, name: 'wormhole_system_class_location_type_and_id'
    remove_column :mapLocationWormholeClasses, :location_type
    
    # mapSolarSystems
    change_table :mapSolarSystems do |t|
      t.boolean :fringe,   default: false
      t.boolean :corridor, default: false
      t.boolean :hub,      default: false
      t.boolean :regional, default: false
      t.boolean :constellation
    end

    SolarSystem.reset_column_information
    SolarSystem.where(topography: 3).update_all(hub: true)
    SolarSystem.where(topography: 2).update_all(corridor: true)
    SolarSystem.where(topography: 1).update_all(fringe: true)
    SolarSystem.where(links: 3).update_all(regional: true)

    change_table :mapSolarSystems do |t|
      t.remove :topography
      t.remove :links
    end
    
    # ramActivities
    remove_index :ramActivities, :data_export
    add_column :ramActivities, :published, :boolean, default: true

    IndustryActivity.reset_column_information
    IndustryActivity.where(data_export: 1).update_all(published: false)

    remove_column :ramActivities, :data_export
    
  end
end
