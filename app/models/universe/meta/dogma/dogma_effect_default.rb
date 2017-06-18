class DogmaEffectDefault < ApplicationRecord
  belongs_to :item,         foreign_key: :type_id,
                            primary_key: :type_id,
                            inverse_of:  :dogma_effect_defaults
  belongs_to :dogma_effect, foreign_key: :effect_id,
                            primary_key: :effect_id,
                            inverse_of:  :dogma_effect_defaults
  
  alias_attribute :effect, :dogma_effect
end
