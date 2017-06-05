class ColonyRoute < ApplicationRecord
  self.primary_key = 'route_id'
  
  belongs_to :content_type,    class_name: 'Item',      inverse_of: :colony_routes
  belongs_to :source_pin,      class_name: 'ColonyPin', inverse_of: :colony_routes
  belongs_to :destination_pin, class_name: 'ColonyPin', inverse_of: :colony_routes
  
  has_many :waypoints, class_name: 'ColonyWaypoint',
                       inverse_of: :colony_route,
                       dependent:  :destroy
  
  alias_attribute :content, :content_type
  alias_attribute :source, :source_pin
  alias_attribute :destination, :destination_pin
end
