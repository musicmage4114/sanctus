class DogmaAttribute < ApplicationRecord
  self.primary_key = 'attribute_id'

  # supplied parameter: boolean - published; true -> 1 -> published, false -> 0 -> unpublished
  enum usage: [:unpublished, :published]
  # supplied parameter: boolean - stackable; true -> 1 -> stackable, false -> 0 -> unstackable
  enum stacking: [:unstackable, :stackable]
  # supplied parameter: boolean - high_is_good; true -> 1 -> high, false -> 0 -> low
  enum good: [:low, :high]
  
  has_many :items, through: :dogma_attribute_values, source: :type
  has_many :possible_values, class_name: 'DogmaAttributeValue', foreign_key: :attribute_id,
                                                                inverse_of: :dogma_attribute
  
  alias_attribute :appears_on, :items
end
