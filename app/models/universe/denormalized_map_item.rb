class DenormalizedMapItem < ApplicationRecord
  self.table_name = 'denormalized_map'
  
  belongs_to :universe_item, foreign_key: :item_id,
                             inverse_of:  :denormalized_map_item
  belongs_to :item_group,    foreign_key: :group_id,
                             inverse_of:  :denormalized_map_item
  belongs_to :solar_system,  inverse_of:  :denormalized_map_item
  belongs_to :constellation, inverse_of:  :denormalized_map_item
  belongs_to :region,        inverse_of:  :denormalized_map_item
  belongs_to :orbited_item,  class_name:  'UniverseItem',
                             foreign_key: :orbit_id,
                             inverse_of:  :denormalized_map_item
  
  alias_attribute :system, :solar_system
  alias_attribute :orbits, :orbited_item
end
