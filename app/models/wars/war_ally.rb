class WarAlly < ApplicationRecord
  belongs_to :war,  inverse_of: :war_allies
  belongs_to :ally, polymorphic: true
end
