class DogmaEffect < ApplicationRecord
  self.primary_key = 'effect_id'
  
  # API data: boolean - disallow_auto_repeat
  enum auto_repeat: [:allowed, :disallowed]
  # API data: boolean - published
  enum data_export: [:unpublished, :published]
  # API data: <value>_attribute_id fields
  enum attribute_type: { discharge:      1,
                         duration:       2,
                         falloff:        3,
                         range:          4,
                         tracking_speed: 5,
                         other:          6 }
  
  belongs_to :dogma_attribute, foreign_key: :attribute_id, inverse_of: :dogma_effects
  
  has_many :modifications,     class_name:  'DogmaEffectModification',
                               foreign_key: :effect_id,
                               inverse_of:  :dogma_effect
  has_many :defaults,          class_name:  'DogmaEffectDefault',
                               inverse_of:  :dogma_effect
end
