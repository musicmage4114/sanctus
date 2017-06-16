class Alliance < ApplicationRecord
  self.primary_key = 'alliance_id'

  # API data: boolean - is_deleted
  enum deletion_status: [:open, :closed]
  
  # AllianceApi
  belongs_to :executor_corporation, class_name:  'Corporation',
                                    primary_key: :corporation_id,
                                    inverse_of:  :alliances
  
  # CharacterApi
  has_many :characters, inverse_of: :alliance
  
  # CorporationApi
  has_many :corporations, inverse_of: :alliance
  has_many :alliance_histories, inverse_of: :alliance
  
  # KillmailApi
  has_many :losses,  class_name:  'Killmail',
                     foreign_key: :victim_alliance_id,
                     inverse_of:  :alliance
  has_many :attacks, class_name:  'KillmailAttacker',
                     foreign_key: :attacker_alliance_id,
                     inverse_of:  :alliance
  has_many :kills,   through:     :attacks,
                     source:      :killmail
  has_many :victims, through:     :kills,
                     source:      :victim

  # SovereigntyApi
  has_many :solar_systems,          inverse_of: :alliance
  has_many :campaign_participants,  inverse_of: :alliance, dependent: :destroy
  has_many :sovereignty_structures, inverse_of: :alliance, dependent: :destroy
  has_many :sovereignty_campaigns,  through:    :campaign_participants,
                                    source:     :campaign,
                                    dependent:  :destroy
  
  # WarsApi
  has_many :aggressive_wars, class_name: 'War',     as: :aggressor
  has_many :defensive_wars,  class_name: 'War',     as: :defender
  has_many :war_assists,     class_name: 'WarAlly', as: :ally

  # TODO: scope :killmails - returns all killmails involving alliance members
  # TODO: scope :past_corporations - shouldn't return current
  # TODO: scope :current_wars
  # TODO: scope :past_wars
  
  alias_attribute :executor, :executor_corporation
end
