class DogmaEffectValue < ApplicationRecord
  belongs_to :dogma_effect, foreign_key: :effect_id,
                            inverse_of:  :dogma_effect_values
  belongs_to :item,         foreign_key: :type_id,
                            inverse_of:  :dogma_effect_values
end
