class Agent < ApplicationRecord
  self.primary_key = 'agent_id'
  
  enum division: { research: 18,
                   distribution: 22,
                   mining: 23,
                   security: 24,
                   business: 25,
                   exploration: 26,
                   industry: 27,
                   military: 28,
                   advanced_military: 29 }
  
  belongs_to :corporation, inverse_of: :agents
  belongs_to :location,    polymorphic: true
  
  has_many :personal_research_agents, inverse_of: :agent
  has_many :research_skills,          class_name: 'ResearchAgentSkill',
                                      inverse_of: :agent
  has_many :standings, as: :relationship
end
