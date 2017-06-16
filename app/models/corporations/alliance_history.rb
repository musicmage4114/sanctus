class AllianceHistory < ApplicationRecord
  belongs_to :corporation, primary_key: :corporation_id,
                           inverse_of:  :alliance_histories
  belongs_to :alliance,    primary_key: :alliance_id,
                           inverse_of:  :alliance_histories
end
