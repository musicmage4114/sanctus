class CorpDivisionDetail < ApplicationRecord
  self.primary_key = 'division_id'
  
  has_many :npc_corp_divisions, foreign_key: :division, inverse_of: :corp_division_detail
  has_many :division_agents,    class_name: 'Agent',
                                foreign_key: :division,
                                inverse_of: :corp_division_details
  has_many :corporations,       through: :npc_corp_divisions, source: :corporation
  
  alias_attribute :leader, :leader_title
end
