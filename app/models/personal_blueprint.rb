class PersonalBlueprint < ApplicationRecord
  self.primary_key = 'item_id'
  
  belongs_to :character, inverse_of: :personal_blueprints
  belongs_to :blueprint, foreign_key: :type_id, inverse_of: :personal_blueprints
  belongs_to :location, polymorphic: true
end
