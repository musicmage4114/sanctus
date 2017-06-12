class Item < ApplicationRecord
  self.primary_key = 'type_id'
  
  belongs_to :item_group,          foreign_key: :group_id, inverse_of: :items
  belongs_to :race,                inverse_of:  :items
  belongs_to :market_group,        inverse_of:  :items
  belongs_to :icon,                inverse_of:  :items
  belongs_to :graphic,             inverse_of:  :items
  belongs_to :sound,               inverse_of:  :items

  has_many :assets,                foreign_key: :type_id, inverse_of: :item
  has_many :base_attribute_values, class_name:  'DogmaAttributeValue',
                                   foreign_key: :type_id,
                                   inverse_of:  :item
  has_many :effect_defaults,       class_name:  'DogmaEffectDefault',
                                   foreign_key: :type_id,
                                   inverse_of:  :item
  has_many :industry_jobs,         foreign_key: :product_id, inverse_of: :item
  has_many :fitting_items,         foreign_key: :type_id, inverse_of: :item
  has_many :killmail_drops,        class_name:  'KillmailItem',
                                   foreign_key: :type_id,
                                   inverse_of:  :item
  has_many :colony_routes,         foreign_key: :content_type_id, inverse_of: :item
  has_many :research_agent_skills, foreign_key: :skill_type_id, inverse_of: :item
  has_many :bloodlines,            foreign_key: :ship_type_id, inverse_of: :item
  has_many :dogma_expressions,     foreign_key: :type_id, inverse_of: :item
  has_many :personal_blueprints,   foreign_key: :type_id, inverse_of: :item
  has_many :colony_pins,           foreign_key: :type_id, inverse_of: :item
  has_many :certificate_masteries, foreign_key: :type_id, inverse_of: :item
  
  has_many :fittings,              through: :fitting_items, source: :fitting
  has_many :killmails,             through: :killmail_items, source: :killmail
  has_many :research_agents,       through: :research_agent_skills, source: :agent
  
  has_and_belongs_to_many :research_corporations, class_name:  'Corporation',
                                                  join_table:  :npc_corp_research,
                                                  foreign_key: :skill_type_id
  has_and_belongs_to_many :item_offers,           class_name:  'Corporation',
                                                  join_table: :npc_corp_item_offers,
                                                  foreign_key: :type_id
  
  alias_attribute :research_corps, :research_corporations
end
