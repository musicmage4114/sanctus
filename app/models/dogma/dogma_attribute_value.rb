class DogmaAttributeValue < ApplicationRecord
  belongs_to :type,            inverse_of: :dogma_attribute_values
  belongs_to :dogma_attribute, inverse_of: :dogma_attribute_values
end
