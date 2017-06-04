class CorporationHistory < ApplicationRecord
  belongs_to :character,   inverse_of: :corporation_histories
  belongs_to :corporation, inverse_of: :corporation_histories
end
