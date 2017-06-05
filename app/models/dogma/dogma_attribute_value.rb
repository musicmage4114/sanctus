class DogmaAttributeValue < ApplicationRecord
  belongs_to :entity,          polymorphic: true
  belongs_to :dogma_attribute, foreign_key: :attribute_id,
                               inverse_of:  :dogma_attribute_values
end
