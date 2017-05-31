class Alliance < ApplicationRecord
  self.primary_key = 'alliance_id'

  # supplied parameter: boolean - is_deleted; true -> 1 -> deleted, false -> 0 -> not_deleted
  enum deletion_status: [:open, :closed]

  belongs_to :executor_corporation, class_name: 'Corporation', foreign_key: :executor_corporation_id,
                                                               inverse_of: :alliances
  has_many :corporations, inverse_of: :alliance
  has_many :characters, inverse_of: :alliance
  has_many :alliance_histories, inverse_of: :alliance
  # TODO: has_many :past_alliances
  
  alias_attribute :executor, :executor_corporation
end
