class Character < ApplicationRecord
  self.primary_key = 'character_id'
  
  # Attributes/Associations
  
  # CharacterApi - supplied parameter: string - gender
  enum gender: { male: 1, female: 2 }

  # AssetsApi
  has_many :assets, as: :owner
  
  # BookmarksApi
  has_many :bookmarks_folders, as: :owner
  has_many :created_bookmarks, class_name: 'Bookmark', foreign_key: :creator_id, inverse_of: :character
  has_many :bookmarks, as: :owner
  
  alias_attribute :owned_bookmarks, :bookmarks
  
  # CalendarApi
  
  has_many :hosted_events, class_name: 'Event', foreign_key: :owner_id, inverse_of: :character
  has_many :event_responses, inverse_of: :character
  
  # CharacterApi
  belongs_to :alliance, inverse_of: :characters, optional: true
  belongs_to :ancestry, inverse_of: :characters, optional: true
  belongs_to :bloodline, inverse_of: :characters
  belongs_to :corporation, inverse_of: :characters
  belongs_to :race, inverse_of: :characters
  has_many :blueprints, through: :personal_blueprints, source: :type
  has_many :medals, through: :medal_awards, source: :medal
  has_many :past_corporations, through: :corporation_histories, source: :corporation
  has_many :personal_blueprints, inverse_of: :character, dependent: :destroy
  has_many :personal_research_agents, inverse_of: :character, dependent: :destroy
  has_many :research_agents, through: :personal_research_agents, source: :agent
  
  # standings
  has_many :standings, inverse_of: :character
  has_many :agent_standings, through: :standings, source: :standing_entity, source_type: 'Agent'
  has_many :npc_corporation_standings, through: :standings, source: :standing_entity, source_type: 'Corporation'
  has_many :faction_standings, through: :standings, source: :standing_entity, source_type: 'Faction'
  
  alias_attribute :npc_corp_standings, :npc_corporation_standings
  
  # chat channels
  has_many :chat_channels, foreign_key: :owner_id, inverse_of: :character
  has_many :allowed_channels, through: :channel_allows, source: :channel
  has_many :blocked_channels, through: :channel_blocks, source: :channel
  has_many :muted_channels, through: :channel_mutes, source: :channel
  has_many :operated_channels, through: :channel_operators, source: :channel

  alias_attribute :channels, :chat_channels
  
  # ClonesApi
  belongs_to :home_station, polymorphic: true
  has_many :jump_clones, inverse_of: :character
  
  alias_attribute :medical_clone, :home_station
  
  # ContactsApi
  has_many :contacts, inverse_of: :character
  has_many :contact_labels, inverse_of: :character
  has_many :character_contacts, through: :contacts, source: :contact_entity, source_type: 'Character'
  has_many :corporation_contacts, through: :contacts, source: :contact_entity, source_type: 'Corporation'
  has_many :alliance_contacts, through: :contacts, source: :contact_entity, source_type: 'Alliance'
  
  # CorporationApi
  has_many :roles
  has_many :grantable_roles

  # FleetApi - fleet membership
  belongs_to :fleet, optional: true
  belongs_to :squad, optional: true
  belongs_to :wing, optional: true
  has_many :fleet_invitations, inverse_of: :character
  
  # FittingsApi
  has_many :fittings
  
  # IndustryApi
  has_many :industry_jobs
  
  # KillmailApi
  has_many :attacker_stats, through: :victims, source: :killmail
  has_many :victim_stats, through: :attackers, source: :killmail
  has_many :victims, foreign_key: :attacker_id, inverse_of: :character
  has_many :attackers, foreign_key: :victim_id, inverse_of: :character
  # TODO: has_many :killmails - all killmails involving that player
  
  # LocationApi
  has_one :current_ship, through: :current_ships, source: :ship_type_id
  belongs_to :current_location, polymorphic: true
  
  # LoyaltyApi
  has_many :loyalty_amounts, inverse_of: :character
  has_many :loyalties, through: :loyalty_amounts, source: :corporation
  
  alias_attribute :loyalty_points, :loyalty_amounts
  
  # MailApi
  has_many :sent_evemails, class_name: 'Evemail', inverse_of: :character
  has_many :evemail_deliveries, foreign_key: :recipient_id, inverse_of: :character
  has_many :mail_labels, inverse_of: :character
  has_many :mailing_lists, inverse_of: :character
  # TODO: has_many :unread_mail
  # TODO: has_many/scope :evemails - returns all evemail
  
  alias_attribute :sent_mail, :sent_evemails
  alias_attribute :received_evemails, :evemail_deliveries
  
  # MarketApi
  has_many :market_orders, as: :order_placement
  # TODO: has_many :buy_orders
  # TODO: has_many :sell_orders
  
  # OpportunitiesApi
  has_many :completed_opportunities, inverse_of: :character
  # TODO: has_many :remaining_opportunities
  
  # PlanetaryInteractionApi
  has_many :colonies, foreign_key: :owner_id, inverse_of: :character
  
  # WalletApi
  has_many :wallets, inverse_of: :character
end
