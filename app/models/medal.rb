class Medal < ApplicationRecord
  self.primary_key = 'medal_id'
  
  belongs_to :corporation, inverse_of: :medals
  
  has_many :medal_awards,  inverse_of: :medal
  has_many :recipients,    through:    :medal_awards, source: :character
end
