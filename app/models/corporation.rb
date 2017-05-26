class Corporation < ApplicationRecord
  self.primary_key = 'corporation_id'

  # supplied parameter: boolean - is_deleted; true -> 1 -> closed, false -> 0 -> open
  enum deletion: [:open, :closed]
  
  # CorporationApi
  belongs_to :alliance, inverse_of: :corporations, optional: true
  belongs_to :ceo, class_name: 'Character', foreign_key: :ceo_id, inverse_of: :corporations
  belongs_to :creator, class_name: 'Character', foreign_key: :creator_id, inverse_of: :corporations
  has_many :characters, inverse_of: :corporation
  has_many :alliance_histories, inverse_of: :corporation
  has_many :past_alliances, through: :alliance_histories, source: :alliance
  has_many :structures, inverse_of: :corporation

  alias_attribute :members, :characters
  alias_attribute :founder, :creator
  
  # SovereigntyApi
  has_many :solar_systems, inverse_of: :corporation
  
  # WarApi
  has_many :aggressive_wars, through: :war_aggressors, source: :war
  has_many :defensive_wars, through: :war_defenders, source: :war
  

  # NPC-specific attributes
  belongs_to :faction, optional: true
  has_many :loyalty_offers, inverse_of: :corporation
  has_many :loyalty_required_items, inverse_of: :corporation
end
