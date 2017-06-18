class DockableStructure < ApplicationRecord
  self.primary_key = 'dockable_id'
  
  belongs_to :solar_system,  primary_key: :system_id,
                             inverse_of:  :dockable_structures
  belongs_to :constellation, primary_key: :constellation_id,
                             inverse_of:  :dockable_structures
  belongs_to :region,        primary_key: :region_id,
                             inverse_of:  :dockable_structures
  belongs_to :station_type,  class_name:  'Item',
                             foreign_key: :station_type_id,
                             primary_key: :type_id,
                             inverse_of:  :dockable_structures
  belongs_to :owner,         class_name:  'Corporation',
                             foreign_key: :corporation_id,
                             primary_key: :corporation_id,
                             inverse_of:  :dockable_structures
  belongs_to :operation,     class_name:  'StationOperation',
                             primary_key: :operation_id,
                             inverse_of:  :dockable_structures
  belongs_to :universe_item, foreign_key: :dockable_id,
                             primary_key: :item_id,
                             inverse_of:  :dockable_structures
end
