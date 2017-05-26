class AllianceHistory < ApplicationRecord
  belongs_to :corporation, inverse_of: :alliance_histories
  belongs_to :alliance, inverse_of: :alliance_histories
end
