class Icon < ApplicationRecord
  self.primary_key = 'icon_id'
  
  has_many :ancestries,          inverse_of: :icon
  has_many :bloodlines,          inverse_of: :icon
  has_many :corporations,        inverse_of: :icon
  has_many :dogma_attributes,    inverse_of: :icon
  has_many :dogma_effects,       inverse_of: :icon
  has_many :factions,            inverse_of: :icon
  has_many :items,               inverse_of: :icon
  has_many :races,               inverse_of: :icon
  has_many :training_attributes, inverse_of: :icon
end
