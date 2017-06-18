class TrainingAttribute < ApplicationRecord
  self.primary_key = 'attribute_id'
  
  belongs_to :icon, primary_key: :icon_id, inverse_of: :training_attributes
end
