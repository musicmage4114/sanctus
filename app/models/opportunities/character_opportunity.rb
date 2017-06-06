class CharacterOpportunity < ApplicationRecord
  belongs_to :character,   inverse_of: :character_opportunities
  belongs_to :opportunity, foreign_key: :task_id, inverse_of: :character_opportunities
end
