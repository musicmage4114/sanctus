class TrainingAttribute < ApplicationRecord
  self.primary_key = 'attribute_id'
  
  belongs_to :icon, inverse_of: :training_attributes
end
