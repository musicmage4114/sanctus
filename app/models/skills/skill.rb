class Skill < ApplicationRecord
  self.primary_key = 'skill_id'
  
  # API data: boolean - published
  enum data_export: [:unpublished, :published]
  
  belongs_to :item_group, foreign_key: :group_id, inverse_of: :skills
  
  has_many :dogma_attribute_values, as: :entity
  has_many :dogma_effects,          as: :entity
  has_many :dogma_attributes,       through: :dogma_attribute_values,
                                    source:  :attribute
  has_many :skill_queue_entries,    foreign_key: :skill_type_id,
                                    inverse_of:  :skill
  has_many :character_skills,       foreign_key: :skill_type_id,
                                    inverse_of:  :skill
  has_many :ships,                  through:     :required_skills,
                                    source:      :usable,
                                    source_type: 'Ship'
end
