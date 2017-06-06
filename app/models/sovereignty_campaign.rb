class SovereigntyCampaign < ApplicationRecord
  self.primary_key = 'campaign_id'
  
  # API data: string - event_type
  enum event_type: { tcu_defense: 1,
                     ihub_defense: 2,
                     station_defense: 3,
                     station_freeport: 4 }
  
  belongs_to :constellation,         inverse_of: :sovereignty_campaigns
  belongs_to :solar_system,          inverse_of: :sovereignty_campaigns
  belongs_to :sovereignty_structure, inverse_of: :sovereignty_campaigns
  
  has_many :participants, class_name:  'CampaignParticipant',
                          foreign_key: :campaign_id,
                          inverse_of:  :sovereignty_campaign
  # TODO: scope :attackers_score
end
