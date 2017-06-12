class DogmaExpression < ApplicationRecord
  self.primary_key = 'expression_id'
  
  belongs_to :type,            inverse_of: :dogma_expressions
  belongs_to :item_group,      inverse_of: :dogma_expressions
  belongs_to :dogma_attribute, foreign_key: :attribute_id,
                               inverse_of: :dogma_expressions
end
