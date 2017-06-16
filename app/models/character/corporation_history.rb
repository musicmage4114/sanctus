class CorporationHistory < ApplicationRecord
  belongs_to :character,   primary_key: :character_id,
                           inverse_of:  :corporation_histories
  belongs_to :corporation, primary_key: :corporation_id,
                           inverse_of:  :corporation_histories
end
