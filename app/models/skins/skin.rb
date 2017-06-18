class Skin < ApplicationRecord
  self.primary_key = 'skin_id'
  
  belongs_to :skin_material, primary_key: :skin_material_id, inverse_of: :skins
  
  has_one :skin_license, inverse_of: :skin
  has_many :ships, class_name: 'SkinShip', inverse_of: :skin
end
