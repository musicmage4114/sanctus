class TowerResource < ApplicationRecord
  enum purpose: { online: 1, power: 2, cpu: 3, reinforce: 4 }
  
  belongs_to :tower_type, class_name: 'Item',
                          primary_key: :type_id,
                          inverse_of:  :tower_resources
  belongs_to :resource,   class_name: 'Item',
                          foreign_key: :resource_type_id,
                          primary_key: :type_id,
                          inverse_of:  :tower_resources
  belongs_to :faction,    primary_key: :faction_id, inverse_of: :tower_resources
end
