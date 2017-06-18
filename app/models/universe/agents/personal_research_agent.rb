class PersonalResearchAgent < ApplicationRecord
  belongs_to :character, primary_key: :character_id,
                         inverse_of:  :personal_research_agents
  belongs_to :agent,     primary_key: :agent_id,
                         inverse_of:  :personal_research_agents
  belongs_to :skill,     foreign_key: :skill_type_id,
                         primary_key: :type_id,
                         inverse_of:  :personal_research_agents
end
