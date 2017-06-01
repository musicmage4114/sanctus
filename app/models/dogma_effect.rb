class DogmaEffect < ApplicationRecord
  self.primary_key = 'effect_id'
  
  # supplied parameter: boolean - disallow_auto_repeat
  # true -> 1 -> disallowed, false -> 0 -> allowed
  enum auto_repeat: [:allowed, :disallowed]
  # supplied parameter: boolean - published
  # true -> 1 -> published, false -> 0 -> unpublished
  enum data_export: [:unpublished, :published]
  
  belongs_to :discharge_attribute, class_name: 'DogmaAttribute', foreign_key: :discharge_attribute_id,
                                                                 inverse_of: :dogma_effects,
                                                                 optional: true
  belongs_to :duration_attribute, class_name: 'DogmaAttribute', foreign_key: :duration_attribute_id,
                                                                inverse_of: :dogma_effects,
                                                                optional: true
  belongs_to :falloff_attribute, class_name: 'DogmaAttribute', foreign_key: :falloff_attribute_id,
                                                               inverse_of: :dogma_effects,
                                                               optional: true
  belongs_to :modified_attribute, class_name: 'DogmaAttribute', foreign_key: :modified_attribute_id,
                                                                inverse_of: :dogma_effects,
                                                                optional: true
  belongs_to :modifying_attribute, class_name: 'DogmaAttribute', foreign_key: :modifying_attribute_id,
                                                                 inverse_of: :dogma_effects,
                                                                 optional: true
  belongs_to :range_attribute, class_name: 'DogmaAttribute', foreign_key: :range_attribute_id,
                                                             inverse_of: :dogma_effects,
                                                             optional: true
  belongs_to :tracking_speed_attribute, class_name: 'DogmaAttribute', foreign_key: :tracking_speed_attribute_id,
                                                                      inverse_of: :dogma_effects,
                                                                      optional: true
  
  alias_attribute :modifies, :modified_attribute
  alias_attribute :modified_by, :modifying_attribute
end
