class DogmaEffectDefault < ApplicationRecord
  belongs_to :type,         inverse_of: :dogma_effect_defaults
  belongs_to :dogma_effect, foreign_key: :effect_id,
                            inverse_of: :dogma_effect_defaults
end
