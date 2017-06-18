class CharacterOpportunity < ApplicationRecord
  belongs_to :character,   primary_key: :character_id,
                           inverse_of:  :character_opportunities
  belongs_to :opportunity, foreign_key: :task_id,
                           primary_key: :task_id,
                           inverse_of:  :character_opportunities
end
