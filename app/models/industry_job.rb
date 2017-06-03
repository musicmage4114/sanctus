class IndustryJob < ApplicationRecord
  self.primary_key = 'job_id'
  
  belongs_to :blueprint,              foreign_key: :blueprint_type_id,
                                      inverse_of:  :industry_jobs
  belongs_to :installer,              class_name:  'Character',
                                      foreign_key: :installer_id,
                                      inverse_of:  :industry_jobs
  belongs_to :completed_character,    class_name:  'Character',
                                      foreign_key: :completed_character_id,
                                      inverse_of:  :industry_jobs,
                                      optional:    true
  belongs_to :product,                class_name:  'Item',
                                      foreign_key: :product_type_id,
                                      inverse_of:  :industry_jobs,
                                      optional:    true
  
  belongs_to :job_blueprint_location, polymorphic: true
  belongs_to :output_location,        polymorphic: true
  belongs_to :job_location,           polymorphic: true
end
