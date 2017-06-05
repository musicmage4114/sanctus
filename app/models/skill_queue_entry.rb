class SkillQueueEntry < ApplicationRecord
  belongs_to :character, inverse_of:  :skill_queue_entries
  belongs_to :skill,     foreign_key: :skill_type_id,
                         inverse_of:  :skill_queue_entries
end
