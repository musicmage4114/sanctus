class DogmaAttributeValue < ApplicationRecord
  belongs_to :item,            foreign_key: :type_id,
                               inverse_of:  :dogma_attribute_values
  belongs_to :dogma_attribute, foreign_key: :attribute_id,
                               inverse_of:  :dogma_attribute_values
end
