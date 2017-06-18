class ColonyRoute < ApplicationRecord
  self.primary_key = 'route_id'
  
  belongs_to :source_pin,      class_name:  'ColonyPin',
                               primary_key: :pin_id,
                               inverse_of:  :colony_routes
  belongs_to :destination_pin, class_name:  'ColonyPin',
                               primary_key: :pin_id,
                               inverse_of:  :colony_routes
  belongs_to :content,         class_name:  'Item',
                               foreign_key: :content_type_id,
                               primary_key: :type_id,
                               inverse_of:  :colony_routes
  
  has_many :waypoints, class_name: 'ColonyWaypoint',
                       inverse_of: :colony_route,
                       dependent:  :destroy
  
  alias_attribute :content, :content_type
  alias_attribute :source, :source_pin
  alias_attribute :destination, :destination_pin
end
