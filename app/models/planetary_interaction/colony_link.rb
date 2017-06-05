class ColonyLink < ApplicationRecord
  belongs_to :source_pin,      class_name: 'ColonyPin', inverse_of: :colony_links
  belongs_to :destination_pin, class_name: 'ColonyPin', inverse_of: :colony_links
  
  alias_attribute :source, :source_pin
  alias_attribute :destination, :destination_pin
end
