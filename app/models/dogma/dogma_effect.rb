class DogmaEffect < ApplicationRecord
  self.primary_key = 'effect_id'
  
  # API data: boolean - disallow_auto_repeat
  enum auto_repeat: [:allowed, :disallowed]
  # API data: boolean - published
  enum data_export: [:unpublished, :published]

  belongs_to :entity,          polymorphic: true
  belongs_to :dogma_attribute, foreign_key: :attribute_id, inverse_of: :dogma_effects
  
  has_many :possible_values, class_name:  'DogmaEffectValue',
                             foreign_key: :effect_id,
                             inverse_of:  :dogma_effect
end
