class RegionScene < ApplicationRecord
  belongs_to :region,  inverse_of: :region_scenes
  belongs_to :graphic, inverse_of: :region_scenes
end
