class ColonyWaypoint < ApplicationRecord
  belongs_to :route, class_name:  'ColonyRoute',
                     primary_key: :route_id,
                     inverse_of:  :colony_waypoints
  belongs_to :pin,   class_name:  'ColonyPin',
                     primary_key: :pin_id,
                     inverse_of:  :colony_waypoints
end
