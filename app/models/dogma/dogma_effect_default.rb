class DogmaEffectDefault < ApplicationRecord
  belongs_to :dogma_effect, inverse_of: :dogma_effect_defaults
  belongs_to :entity,       polymorphic: true
  
  alias_attribute :effect, :dogma_effect
end
