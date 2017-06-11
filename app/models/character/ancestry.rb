class Ancestry < ApplicationRecord
  self.primary_key = 'ancestry_id'
  
  belongs_to :bloodline, inverse_of: :ancestries
  belongs_to :icon,      inverse_of: :ancestries
  
  has_many :characters, inverse_of: :ancestry
end
