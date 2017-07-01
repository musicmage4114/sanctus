class Character < ApplicationRecord
  self.primary_key = 'character_id'
  
  # Attributes/Associations
  
  # CharacterApi - supplied parameter: string - gender
  enum gender: { male: 1, female: 2 }

  # AssetsApi
  has_many :asset_items, as: :owner
  
  # BookmarksApi
  has_many :created_bookmarks, class_name: 'Bookmark',
                               foreign_key: :creator_id,
                               inverse_of: :character
  has_many :bookmarks_folders, as: :folder_owner, dependent: :destroy
  has_many :owned_bookmarks,   class_name: 'Bookmark',
                               as: :bookmark_owner,
                               dependent: :destroy
  
  alias_attribute :bookmarks, :owned_bookmarks
  
  # CalendarApi
  has_many :event_responses, inverse_of:  :character
  has_many :hosted_events,   class_name:  'Event',
                             foreign_key: :owner_id,
                             inverse_of:  :character
  
  # CharacterApi
  belongs_to :alliance,    primary_key: :alliance_id,
                           inverse_of:  :characters,
                           optional:    true
  belongs_to :ancestry,    primary_key: :ancestry_id,
                           inverse_of:  :characters,
                           optional:    true
  belongs_to :bloodline,   primary_key: :bloodline_id,
                           inverse_of:  :characters
  belongs_to :corporation, primary_key: :corporation_id,
                           inverse_of:  :characters
  belongs_to :race,        primary_key: :race_id,
                           inverse_of:  :characters

  has_many :medal_awards,             inverse_of: :character
  has_many :medals,                   through: :medal_awards, source: :medal
  has_many :blueprints,               through: :personal_blueprints, source: :type
  has_many :personal_blueprints,      inverse_of: :character, dependent: :destroy
  has_many :personal_research_agents, inverse_of: :character, dependent: :destroy
  has_many :research_agents,          through: :personal_research_agents,
                                      source: :agent
  has_many :corporation_histories,    inverse_of: :corporation, dependent: :destroy
  has_many :standings,                inverse_of: :character, dependent: :destroy
  has_many :chat_channels,            foreign_key: :owner_id, inverse_of: :character
  has_many :allowed_channels,         as: :allowed,  dependent: :destroy
  has_many :blocked_channels,         as: :blocked,  dependent: :destroy
  has_many :muted_channels,           as: :muted,    dependent: :destroy
  has_many :operated_channels,        as: :operator, dependent: :destroy
  
  alias_attribute :employment_history, :corporation_histories
  alias_attribute :channels, :chat_channels
  alias_attribute :operates, :operated_channels
  alias_attribute :kicked,   :blocked_channels
  
  # ClonesApi
  belongs_to :home_station, polymorphic: true, optional: true, dependent: :destroy
  
  has_many :jump_clones, inverse_of: :character, dependent: :destroy
  
  alias_attribute :medical_clone, :home_station
  
  # ContactsApi
  has_many :contacts,             inverse_of:  :character, dependent: :destroy
  has_many :contact_labels,       inverse_of:  :character, dependent: :destroy
  has_many :character_contacts,   through:     :contacts,
                                  source:      :diplomacy,
                                  source_type: 'Character'
  has_many :corporation_contacts, through:     :contacts,
                                  source:      :diplomacy,
                                  source_type: 'Corporation'
  has_many :alliance_contacts,    through:     :contacts,
                                  source:      :diplomacy,
                                  source_type: 'Alliance'
  
  # CorporationApi
  has_many :roles,           dependent: :destroy
  has_many :grantable_roles, dependent: :destroy

  # FleetApi
  has_one :fleet_membership,   inverse_of: :character, dependent: :destroy
  has_many :fleet_invitations, inverse_of: :character, dependent: :destroy
  
  alias_attribute :fleet, :fleet_membership
  
  # FittingsApi
  has_many :fittings
  
  # IndustryApi
  has_many :installed_jobs, foreign_key: :installer_id,
                            inverse_of:  :character,
                            dependent:   :destroy
  has_many :completed_jobs, foreign_key: :completed_character_id,
                            inverse_of:  :character,
                            dependent:   :destroy
                            
  # KillmailApi
  has_many :final_blows,        class_name:  'Killmail',         as: :final_blow
  has_many :attacks,            class_name:  'KillmailAttacker', as: :attacker
  has_many :kills,              through:     :attacks,
                                source:      :killmail,
                                source_type: 'Character'
  has_many :losses,             class_name:  'Killmail',
                                foreign_key: :victim_id,
                                inverse_of:  :character
  has_many :victims,            through:     :kills,
                                source:      :victim
  
  # LocationApi
  belongs_to :current_location, polymorphic: true, optional: true
  has_one :current_ship, inverse_of: :character
  
  # LoyaltyApi
  has_many :loyalty_amounts, inverse_of: :character, dependent: :destroy
  has_many :loyalties,       through: :loyalty_amounts, source: :corporation
  
  alias_attribute :loyalty_points, :loyalty_amounts
  
  # MailApi
  has_many :evemail_deliveries,         class_name:  'MailRecipient',
                                        foreign_key: :recipient_id,
                                        inverse_of:  :character
  has_many :received_evemails,          through:     :mail_recipients,
                                        source:      :evemail
  has_many :sent_evemails,              class_name:  'Evemail',
                                        foreign_key: :from_id,
                                        inverse_of:  :character
  has_many :mail_labels,                inverse_of:  :character
  has_many :mailing_list_subscriptions, foreign_key: :subscriber_id,
                                        inverse_of:  :character
  has_many :mailing_lists,              through:     :mailing_list_subscriptions,
                                        source:      :mailing_list
  
  # MarketApi
  has_many :market_orders, as: :order_placement, dependent: :destroy
  
  # OpportunitiesApi
  has_many :opportunities, class_name: 'CharacterOpportunity',
                           inverse_of: :character
  
  # PlanetaryInteractionApi
  has_many :colonies, foreign_key: :owner_id,
                      inverse_of:  :character,
                      dependent:   :destroy
  
  # SkillsApi
  has_many :skill_queue_entries, inverse_of: :character, dependent: :destroy
  has_many :skills,              class_name: 'CharacterSkill',
                                 inverse_of: :character,
                                 dependent:  :destroy
  
  # WalletApi
  has_many :wallets, inverse_of: :character
  
  # TODO: scope :past_corporations - shouldn't return current
  # TODO: scope :npc agent_standings
  # TODO: scope :npc corporation_standings
  # TODO: scope :faction_standings
  # TODO: scope :banned_channels - channels a character is banned from
  # TODO: alias_attribute :banned, :banned_channels
  # TODO: scope :killmails - returns all killmails involving the character
  # TODO: scope :unread_mail
  # TODO: scope :total_unread_mail
  # TODO: scope :evemails - returns all sent and received evemails
  # TODO: scope :buy_orders
  # TODO: scope :sell_orders
  # TODO: scope :remaining_opportunities
  # TODO: scope :completed_opportunities
end
