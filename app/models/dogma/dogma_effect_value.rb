class DogmaEffectValue < ApplicationRecord
  belongs_to :dogma_effect,        foreign_key: :effect_id,
                                   inverse_of:  :dogma_effect_values
  belongs_to :modified_attribute,  class_name:  'DogmaAttribute',
                                   inverse_of:  :dogma_effect_values
  belongs_to :modifying_attribute, class_name:  'DogmaAttribute',
                                   inverse_of:  :dogma_effect_values
end
