class Graphic < ApplicationRecord
  self.primary_key = 'graphic_id'
  
  has_many :items, inverse_of: :graphic
end
