class Bloodline < ApplicationRecord
  self.primary_key = 'bloodline_id'
  
  belongs_to :race,        primary_key: :race_id,        inverse_of: :bloodlines
  belongs_to :corporation, primary_key: :corporation_id, inverse_of: :bloodlines
  belongs_to :icon,        primary_key: :icon_id,        inverse_of: :bloodlines
  belongs_to :ship,        class_name:  'Item',
                           foreign_key: :ship_type_id,
                           primary_key: :type_id,
                           inverse_of:  :bloodline
  
  has_many :characters,    inverse_of:  :bloodline
  
  # TODO: #attributes -> return all five attributes
  
  alias_attribute :ship, :corvette
  alias_attribute :ship, :rookie_ship
  alias_attribute :ship, :racial_corvette
end
