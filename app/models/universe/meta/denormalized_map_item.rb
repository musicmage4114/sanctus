class DenormalizedMapItem < ApplicationRecord
  self.table_name = 'denormalized_map'
  
  belongs_to :universe_item, foreign_key: :item_id,
                             primary_key: :item_id,
                             inverse_of:  :denormalized_map_item
  belongs_to :item_group,    foreign_key: :group_id,
                             primary_key: :group_id,
                             inverse_of:  :denormalized_map_item
  belongs_to :solar_system,  primary_key: :system_id,
                             inverse_of:  :denormalized_map_item,
                             optional:    true
  belongs_to :constellation, primary_key: :constellation_id,
                             inverse_of:  :denormalized_map_item,
                             optional:    true
  belongs_to :region,        primary_key: :region_id,
                             inverse_of:  :denormalized_map_item,
                             optional:    true
  belongs_to :orbited_item,  class_name:  'UniverseItem',
                             foreign_key: :orbit_id,
                             primary_key: :item_id,
                             inverse_of:  :denormalized_map_item,
                             optional:    true
  
  alias_attribute :system, :solar_system
  alias_attribute :orbits, :orbited_item
end
