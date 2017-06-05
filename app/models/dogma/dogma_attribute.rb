class DogmaAttribute < ApplicationRecord
  self.primary_key = 'attribute_id'

  # API data: boolean - published
  enum data_export: [:unpublished, :published]
  # API data: boolean - stackable
  enum stacking: [:unstackable, :stackable]
  # API data: boolean - high_is_good
  enum good: [:low, :high]

  has_many :dogma_effects,    foreign_key: :attribute_id,
                              inverse_of:  :dogma_attribute
  has_many :possible_values,  class_name:  'DogmaAttributeValue',
                              foreign_key: :attribute_id,
                              inverse_of:  :dogma_attribute
  has_many :effects_modified, class_name:  'DogmaEffectValue',
                              foreign_key: :modifying_attribute_id,
                              inverse_of:  :dogma_attribute
  has_many :modified_by,      class_name:  'DogmaEffectValue',
                              foreign_key: :modified_attribute_id,
                              inverse_of:  :dogma_attribute
end
