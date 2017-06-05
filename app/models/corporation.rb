class Corporation < ApplicationRecord
  self.primary_key = 'corporation_id'

  # API data: boolean - is_deleted
  enum deletion_status: [:open, :closed]
  
  # AssetsApi
  has_many :assets,           as: :asset_owner, dependent: :destroy
  
  # BookmarksApi
  has_many :bookmarks,        as: :owner
  
  # CharacterApi
  has_many :allowed_channels, as: :allowed, dependent: :destroy
  has_many :blocked_channels, as: :blocked, dependent: :destroy
  
  # CorporationApi
  belongs_to :alliance,         inverse_of:  :corporations, optional: true
  belongs_to :ceo,              class_name:  'Character',
                                foreign_key: :ceo_id,
                                inverse_of:  :corporations
  belongs_to :creator,          class_name:  'Character',
                                foreign_key: :creator_id,
                                inverse_of:  :corporations

  has_many :characters,         inverse_of:  :corporation
  has_many :structures,         inverse_of:  :corporation
  has_many :alliance_histories, inverse_of:  :corporation, dependent: :destroy
  # TODO: scope :past_alliances - shouldn't return current

  alias_attribute :members, :characters
  alias_attribute :founder, :creator
  
  # KillmailApi
  has_many :losses,           class_name:  'Killmail',
                              foreign_key: :victim_corporation_id,
                              inverse_of:  :corporation
  has_many :killmail_attacks, class_name:  'KillmailAttacker',
                              foreign_key: :attacker_corporation_id,
                              inverse_of:  :corporation
  has_many :kills,            through:     :killmail_attackers,
                              source:      :killmail
  has_many :victims,          through:     :kills,
                              source:      :victim
  # TODO: scope :killmails - returns all killmails of corporation members
  
  # SovereigntyApi
  has_many :solar_systems,   inverse_of: :corporation
  
  # WarApi
  has_many :aggressive_wars, through: :war_aggressors, source: :war
  has_many :defensive_wars,  through: :war_defenders,  source: :war
  # TODO: has_many :current_wars
  # TODO: has_many :past_wars
  
  # NPC-specific attributes
  belongs_to :faction,      inverse_of: :corporations, optional: true
  
  has_many :loyalty_offers, inverse_of: :corporation
end
