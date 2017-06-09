class Ship < Item
  self.primary_key = 'type_id'
  
  enum tech_level: { tech_1: 1, tech_2: 2, tech_3: 3, faction: 4 }
  # API data: boolean - published
  enum data_export: [:unpublished, :published]
  
  belongs_to :item_group,     foreign_key: :group_id, inverse_of: :ships
  
  has_many :extra_cargoholds, foreign_key: :ship_id,  inverse_of: :ship
  
  alias_attribute :group, :item_group
end
