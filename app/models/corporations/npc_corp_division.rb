class NpcCorpDivision < ApplicationRecord
  enum division: { research: 18,
                   distribution: 22,
                   mining: 23,
                   security: 24,
                   business: 25,
                   exploration: 26,
                   industry: 27,
                   military: 28,
                   advanced_military: 29 }
  
  belongs_to :corporation, inverse_of: :npc_corp_divisions
end
