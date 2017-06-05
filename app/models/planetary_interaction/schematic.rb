class Schematic < ApplicationRecord
  self.primary_key = 'schematic_id'
  
  has_many :colony_pins, inverse_of: :schematic
  
  alias_attribute :extractors, :colony_pins
end
