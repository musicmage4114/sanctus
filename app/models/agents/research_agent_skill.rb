class ResearchAgentSkill < ApplicationRecord
  belongs_to :agent, inverse_of: :research_agent_skills
  belongs_to :skill, foreign_key: :skill_type_id, inverse_of: :research_agent_skills
end
