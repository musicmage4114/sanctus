class DogmaEffect < ApplicationRecord
  self.primary_key = 'effect_id'
  
  # API data: boolean - disallow_auto_repeat
  enum auto_repeat: [:allowed, :disallowed]
  # API data: boolean - published
  enum data_export: [:unpublished, :published]
  enum warp_safety: [:unsafe, :safe]
  
  belongs_to :duration_attribute,              class_name: 'DogmaAttribute',
                                               inverse_of: :dogma_effects
  belongs_to :tracking_speed_attribute,        class_name: 'DogmaAttribute',
                                               inverse_of: :dogma_effects
  belongs_to :discharge_attribute,             class_name: 'DogmaAttribute',
                                               inverse_of: :dogma_effects
  belongs_to :range_attribute,                 class_name: 'DogmaAttribute',
                                               inverse_of: :dogma_effects
  belongs_to :falloff_attribute,               class_name: 'DogmaAttribute',
                                               inverse_of: :dogma_effects
  belongs_to :npc_usage_chance_attribute,      class_name: 'DogmaAttribute',
                                               inverse_of: :dogma_effects
  belongs_to :npc_activation_chance_attribute, class_name: 'DogmaAttribute',
                                               inverse_of: :dogma_effects
  belongs_to :fitting_usage_chance_attribute,  class_name: 'DogmaAttribute',
                                               inverse_of: :dogma_effects
  
  has_many :modifications,     class_name:  'DogmaEffectModification',
                               foreign_key: :effect_id,
                               inverse_of:  :dogma_effect
  has_many :defaults,          class_name:  'DogmaEffectDefault',
                               inverse_of:  :dogma_effect
end
