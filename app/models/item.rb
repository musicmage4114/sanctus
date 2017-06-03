class Item < ApplicationRecord
  self.primary_key = 'type_id'
  
  # API data: boolean - published
  enum data_export: [:unpublished, :published]
  
  belongs_to :item_group,           foreign_key: :group_id, inverse_of: :items
  
  has_many :dogma_attribute_values, foreign_key: :type_id,  inverse_of: :item
  has_many :dogma_effect_values,    foreign_key: :type_id,  inverse_of: :item
  has_many :dogma_effects,          through: :dogma_effect_values,    source: :effect
  has_many :dogma_attributes,       through: :dogma_attribute_values, source: :attribute
  has_many :killmail_drops,         as: :killmail_loot
end
