class PersonalBlueprint < ApplicationRecord
  self.primary_key = 'item_id'
  
  belongs_to :character, primary_key: :character_id,
                         inverse_of:  :personal_blueprints
  belongs_to :blueprint, class_name:  'Item',
                         foreign_key: :type_id,
                         primary_key: :type_id,
                         inverse_of:  :personal_blueprints
  belongs_to :location,  polymorphic: true
end
