class ResearchAgentSkill < ApplicationRecord
  belongs_to :agent, primary_key: :agent_id,
                     inverse_of:  :research_agent_skills
  belongs_to :skill, foreign_key: :skill_type_id,
                     primary_key: :type_id,
                     inverse_of:  :research_agent_skills
end
