class Race < ApplicationRecord
  self.primary_key = 'race_id'
  
  belongs_to :alliance, primary_key: :alliance_id,
                        inverse_of:  :races
  
  has_many :bloodlines, inverse_of: :race
  has_many :ancestries, inverse_of: :race
  has_many :characters, inverse_of: :race
end
