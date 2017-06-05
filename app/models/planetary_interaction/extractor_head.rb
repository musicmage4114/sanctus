class ExtractorHead < ApplicationRecord
  self.primary_key = 'head_id'
  
  belongs_to :pin, class_name: 'ColonyPin', inverse_of: :extractor_heads
end
