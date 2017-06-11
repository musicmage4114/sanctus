class PersonalResearchAgent < ApplicationRecord
  belongs_to :character, inverse_of:  :personal_research_agents
  belongs_to :agent,     inverse_of:  :personal_research_agents
  belongs_to :skill,     foreign_key: :skill_type_id,
                         inverse_of:  :personal_research_agents
end
