class CharacterSkill < ApplicationRecord
  belongs_to :character, inverse_of:  :character_skills
  belongs_to :skill,     foreign_key: :skill_type_id,
                         inverse_of:  :character_skills
end
