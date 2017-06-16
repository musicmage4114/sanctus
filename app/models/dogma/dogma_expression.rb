class DogmaExpression < ApplicationRecord
  self.primary_key = 'expression_id'
  
  belongs_to :item,            foreign_key: :type_id,
                               primary_key: :type_id,
                               inverse_of:  :dogma_expressions
  belongs_to :item_group,      primary_key: :group_id,
                               inverse_of:  :dogma_expressions
  belongs_to :dogma_attribute, foreign_key: :attribute_id,
                               primary_key: :attribute_id,
                               inverse_of:  :dogma_expressions
end
