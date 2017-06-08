class Item < ApplicationRecord
  self.abstract_class = true

  has_many :dogma_attribute_values, as: :entity
  has_many :dogma_effect_defaults,  as: :entity
  
  has_many :dogma_attributes, through: :dogma_attribute_values, source: :attribute
  has_many :dogma_effects,    through: :dogma_effect_defaults,  source: :dogma_effect

  has_one :item_group_membership, foreign_key: :member_id, inverse_of: :blueprints
  has_one :item_group,            through: :item_group_memberships, source: :group
  
  alias_attribute
end
