class DogmaEffect < ApplicationRecord
  self.primary_key = 'effect_id'
  
  # API data: boolean - disallow_auto_repeat
  enum auto_repeat: [:allowed, :disallowed]
  # API data: boolean - published
  enum data_export: [:unpublished, :published]
  
  belongs_to :dogma_attribute,     foreign_key: :attribute_id,
                                   inverse_of:  :dogma_effects
  belongs_to :modified_attribute,  class_name:  'DogmaAttribute',
                                   foreign_key: :modified_attribute_id,
                                   inverse_of:  :dogma_effects,
                                   optional:    true
  belongs_to :modifying_attribute, class_name:  'DogmaAttribute',
                                   foreign_key: :modifying_attribute_id,
                                   inverse_of:  :dogma_effects,
                                   optional:    true
  
  alias_attribute :modifies, :modified_attribute
  alias_attribute :modified_by, :modifying_attribute
end
