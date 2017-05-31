class PersonalResearchAgent < ApplicationRecord
  belongs_to :character, inverse_of: :personal_research_agents
  belongs_to :agent, inverse_of: :personal_research_agents
end
