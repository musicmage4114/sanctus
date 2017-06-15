class Schematic < ApplicationRecord
  self.primary_key = 'schematic_id'
  
  has_many :colony_pins,        inverse_of: :schematic
  has_many :pin_schematics,     inverse_of: :schematic
  has_many :materials,          class_name: 'SchematicMaterial',
                                inverse_of: :schematic
  has_many :possible_factories, through: :pin_schematics, source: :pin_type
  
  alias_attribute :extractors, :colony_pins
end
