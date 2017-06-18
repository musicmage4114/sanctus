class Ancestry < ApplicationRecord
  self.primary_key = 'ancestry_id'
  
  belongs_to :bloodline, primary_key: :bloodline_id, inverse_of: :ancestries
  belongs_to :icon,      primary_key: :icon_id,      inverse_of: :ancestries
  
  has_many :characters, inverse_of: :ancestry
end
