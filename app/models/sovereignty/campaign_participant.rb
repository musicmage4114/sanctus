class CampaignParticipant < ApplicationRecord
  # API data: derived from event_type in SovereigntyCampaign
  enum role: { attacker: 1, defender: 2, participant: 3 }
  
  belongs_to :campaign, class_name:  'SovereigntyCampaign',
                        foreign_key: :campaign_id,
                        primary_key: :campaign_id,
                        inverse_of:  :campaign_participants
  belongs_to :alliance, primary_key: :alliance_id,
                        inverse_of:  :campaign_participants
end
