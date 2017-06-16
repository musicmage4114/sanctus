class CharacterSkill < ApplicationRecord
  belongs_to :character, primary_key: :character_id, inverse_of: :character_skills
  belongs_to :skill,     class_name:  'Item',
                         foreign_key: :skill_type_id,
                         primary_key: :type_id,
                         inverse_of:  :character_skills
end
