class RegionScene < ApplicationRecord
  belongs_to :region,  primary_key: :region_id,  inverse_of: :region_scenes
  belongs_to :graphic, primary_key: :graphic_id, inverse_of: :region_scenes
end
