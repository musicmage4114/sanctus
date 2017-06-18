class RegionConnection < ApplicationRecord
  belongs_to :from_region, class_name:  'Region',
                           primary_key: :region_id,
                           inverse_of:  :region_connections
  belongs_to :to_region,   class_name:  'Region',
                           primary_key: :region_id,
                           inverse_of:  :region_connections
end
