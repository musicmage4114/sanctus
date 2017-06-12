class DogmaAttributeValue < ApplicationRecord
  belongs_to :dogma_attribute, inverse_of:  :dogma_attribute_values
  belongs_to :item,            foreign_key: :type_id,
                               inverse_of:  :dogma_attribute_values
end
