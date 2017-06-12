class DogmaAttributeCategory < ApplicationRecord
  self.primary_key = 'category_id'
  
  has_many :dogma_attributes, foreign_key: :category_id,
                              inverse_of:  :dogma_attribute_category
  
  alias_attribute :attributes, :dogma_attributes
end
