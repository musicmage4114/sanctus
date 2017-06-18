class ExtractorHead < ApplicationRecord
  self.primary_key = 'head_id'
  
  belongs_to :pin, class_name:  'ColonyPin',
                   primary_key: :pin_id,
                   inverse_of:  :extractor_heads
end
