class ColonyWaypoint < ApplicationRecord
  belongs_to :route, class_name: 'ColonyRoute', inverse_of: :colony_waypoints
  belongs_to :pin,   class_name: 'ColonyPin',   inverse_of: :colony_waypoints
end
