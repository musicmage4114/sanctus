class Item < ApplicationRecord
  self.primary_key = 'type_id'
  
  belongs_to :item_group,   foreign_key: :group_id,
                            primary_key: :group_id,
                            inverse_of:  :items
  belongs_to :market_group, primary_key: :market_group_id,
                            inverse_of:  :items
  belongs_to :icon,         primary_key: :icon_id,    inverse_of: :items
  belongs_to :graphic,      primary_key: :graphic_id, inverse_of: :items
  belongs_to :race,         primary_key: :race_id,    inverse_of: :items
  belongs_to :sound,        primary_key: :sound_id,   inverse_of: :items
  
  has_one :alternate_volume, class_name:  'ItemVolume',
                             foreign_key: :type_id,
                             inverse_of:  :item
  
  has_many :item_assets,            foreign_key: :type_id, inverse_of: :item
  has_many :base_attribute_values,  class_name:  'DogmaAttributeValue',
                                    foreign_key: :type_id,
                                    inverse_of:  :item
  has_many :effect_defaults,        class_name:  'DogmaEffectDefault',
                                    foreign_key: :type_id,
                                    inverse_of:  :item
  has_many :industry_jobs,          foreign_key: :product_id, inverse_of: :item
  has_many :fitting_items,          foreign_key: :type_id, inverse_of: :item
  has_many :killmail_drops,         class_name:  'KillmailItem',
                                    foreign_key: :type_id,
                                    inverse_of:  :item
  has_many :colony_routes,          foreign_key: :content_type_id, inverse_of: :item
  has_many :research_agent_skills,  foreign_key: :skill_type_id, inverse_of: :item
  has_many :bloodlines,             foreign_key: :ship_type_id, inverse_of: :item
  has_many :dogma_expressions,      foreign_key: :type_id, inverse_of: :item
  has_many :personal_blueprints,    foreign_key: :type_id, inverse_of: :item
  has_many :colony_pins,            foreign_key: :type_id, inverse_of: :item
  has_many :certificate_masteries,  foreign_key: :type_id, inverse_of: :item
  has_many :industry_times,         foreign_key: :blueprint_id, inverse_of: :item
  has_many :required_material,      class_name:  'BlueprintMaterial',
                                    foreign_key: :material_type_id,
                                    inverse_of:  :item
  has_many :materials,              class_name:  'BlueprintMaterial',
                                    foreign_key: :blueprint_id,
                                    inverse_of:  :item
  has_many :industry_probabilities, foreign_key: :blueprint_id,
                                    inverse_of:  :item
  has_many :invention_products,     class_name:  'IndustryProbability',
                                    foreign_key: :product_type_id,
                                    inverse_of:  :item
  has_many :blueprint_products,     foreign_key: :blueprint_id,
                                    inverse_of:  :item
  has_many :products,               class_name:  'BlueprintProduct',
                                    foreign_key: :product_type_id,
                                    inverse_of:  :item
  has_many :universe_item,          foreign_key: :type_id, inverse_of: :item
  has_many :denormalized_map_items, foreign_key: :type_id, inverse_of: :item
  has_many :pin_schematics,         foreign_key: :pin_type_id, inverse_of: :item
  has_many :schematic_materials,    foreign_key: :material_id, inverse_of: :item
  has_many :stargates,              foreign_key: :stargate_type_id,
                                    inverse_of:  :item
  has_many :suns,                   foreign_key: :sun_type_id, inverse_of: :item
  has_many :skin_licenses,          foreign_key: :license_type_id,
                                    inverse_of:  :type_id
  has_many :tower_resources,        foreign_key: :tower_type_id,
                                    inverse_of:  :item
  
  # join table/model - meta_variations
  has_many :higher_meta_variants,   class_name:  'MetaVariation',
                                    foreign_key: :base_type_id,
                                    inverse_of:  :item
  has_many :meta_variants,          through:     :higher_meta_variants,
                                    source:      :meta_type
  has_many :base_meta_variants,     class_name:  'MetaVariation',
                                    foreign_key: :meta_type_id,
                                    inverse_of:  :item
  has_many :base_variants,          through:     :base_meta_variants,
                                    source:      :base_type
  
  # join table/model - item_materials
  has_many :item_material_types,    class_name:  'ItemMaterial',
                                    foreign_key: :type_id,
                                    inverse_of:  :item
  has_many :component_materials,    through:     :item_material_types,
                                    source:      :material_type
  has_many :items_as_material,      class_name:  'ItemMaterial',
                                    foreign_key: :material_type_id,
                                    inverse_of:  :item
  has_many :included_in_items,      through:     :included_as_material,
                                    source:      :type
  
  alias_attribute :components, :component_materials
  
  # join table/model - industry_reactions
  has_many :reaction_formulas,      class_name:  'IndustryReaction',
                                    foreign_key: :reaction_type_id,
                                    inverse_of:  :item
  has_many :reagents,               through:     :industry_reactions,
                                    source:      :reagent
  has_many :reactions_as_reagent,   class_name:  'IndustryReaction',
                                    foreign_key: :reagent_id,
                                    inverse_of:  :item
  has_many :reactions,              through:     :reactions_as_reagent,
                                    source:      :reaction_type
  
  has_many :fittings,               through: :fitting_items, source: :fitting
  has_many :killmails,              through: :killmail_items, source: :killmail
  has_many :research_agents,        through: :research_agent_skills, source: :agent
  has_many :variations,             through: :meta_variations, source: :meta_type
  
  has_and_belongs_to_many :research_corporations, class_name:  'Corporation',
                                                  join_table:  :npc_corp_research,
                                                  foreign_key: :skill_type_id
  has_and_belongs_to_many :item_offers,           class_name:  'Corporation',
                                                  join_table: :npc_corp_item_offers,
                                                  foreign_key: :type_id
  
  alias_attribute :research_corps, :research_corporations
end
