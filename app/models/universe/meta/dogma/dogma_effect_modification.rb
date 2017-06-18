class DogmaEffectModification < ApplicationRecord
  belongs_to :dogma_effect,        foreign_key: :effect_id,
                                   primary_key: :effect_id,
                                   inverse_of:  :dogma_effect_modifications
  belongs_to :modified_attribute,  class_name:  'DogmaAttribute',
                                   primary_key: :attribute_id,
                                   inverse_of:  :dogma_effect_modifications
  belongs_to :modifying_attribute, class_name:  'DogmaAttribute',
                                   primary_key: :attribute_id,
                                   inverse_of:  :dogma_effect_modifications
  
  alias_attribute :effect, :dogma_effect
end
