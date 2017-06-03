class Alliance < ApplicationRecord
  self.primary_key = 'alliance_id'

  # API data: boolean - is_deleted
  enum deletion_status: [:open, :closed]

  belongs_to :executor_corporation, class_name:  'Corporation', inverse_of:  :alliances
  has_many :corporations,           inverse_of:  :alliance
  has_many :characters,             inverse_of:  :alliance
  has_many :alliance_histories,     inverse_of:  :alliance
  has_many :losses,                 class_name:  'Killmail',
                                    foreign_key: :victim_alliance_id,
                                    inverse_of:  :alliance
  has_many :killmail_attacks,       class_name:  'KillmailAttacker',
                                    foreign_key: :attacker_alliance_id,
                                    inverse_of:  :alliance
  has_many :kills,                  through:     :killmail_attackers,
                                    source:      :killmail
  has_many :victims,                through:     :kills,
                                    source:      :victim
  # TODO: scope :killmails - returns all killmails involving alliance members
  # TODO: scope :past_corporations - shouldn't return current
  
  alias_attribute :executor, :executor_corporation
end
