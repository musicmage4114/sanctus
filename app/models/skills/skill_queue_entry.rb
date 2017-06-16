class SkillQueueEntry < ApplicationRecord
  belongs_to :character, primary_key: :character_id,
                         inverse_of:  :skill_queue_entries
  belongs_to :skill,     class_name:  'Item',
                         foreign_key: :skill_type_id,
                         primary_key: :type_id,
                         inverse_of:  :skill_queue_entries
end
