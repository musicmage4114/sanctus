class ColonyPin < ApplicationRecord
  self.primary_key = 'pin_id'
  
  # API data: boolean - is_running
  enum status: [:inactive, :active]
  
  belongs_to :colony,        inverse_of:  :colony_pins
  belongs_to :type,          class_name:  'Item', inverse_of: :colony_pins
  belongs_to :schematic,     inverse_of:  :colony_pins, optional: true
  
  has_many :extractor_heads, inverse_of:  :colony_pin, dependent: :destroy
  has_many :waypoints,       class_name:  'ColonyWaypoint',
                             foreign_key: :pin_id,
                             inverse_of:  :colony_pin,
                             dependent:   :destroy
  
  alias_attribute :heads, :extractor_heads
end
