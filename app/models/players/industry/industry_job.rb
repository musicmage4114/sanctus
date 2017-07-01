class IndustryJob < ApplicationRecord
  self.primary_key = 'job_id'

  enum activity_type: { none: 0,
                        manufacturing: 1,
                        technology: 2,
                        time_efficiency: 3,
                        material_efficiency: 4,
                        copying: 5,
                        duplicating: 6,
                        reverse_engineering: 7,
                        invention: 8 }
  
  belongs_to :blueprint,    class_name:  'Item',
                            foreign_key: :blueprint_type_id,
                            primary_key: :type_id,
                            inverse_of:  :industry_jobs
  belongs_to :installer,    class_name:  'Character',
                            foreign_key: :installer_id,
                            primary_key: :character_id,
                            inverse_of:  :industry_jobs
  belongs_to :completed_by, class_name:  'Character',
                            foreign_key: :completed_character_id,
                            primary_key: :character_id,
                            inverse_of:  :industry_jobs,
                            optional:    true
  belongs_to :product,      class_name:  'Item',
                            foreign_key: :product_id,
                            primary_key: :type_id,
                            inverse_of:  :industry_jobs
  
  belongs_to :job_blueprint_location, polymorphic: true
  belongs_to :output_location,        polymorphic: true
  belongs_to :job_location,           polymorphic: true
end
