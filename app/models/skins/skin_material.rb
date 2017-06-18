class SkinMaterial < ApplicationRecord
  self.primary_key = 'skin_material_id'
  
  has_many :skins, inverse_of: :skin_material
end
