class CreateIndustryJobs < ActiveRecord::Migration[5.1]
  def change
    create_table :industry_jobs, id: false do |t|
      t.integer    :job_id,                 null: false, index: { unique: true }
      t.belongs_to :activity,               null: false, index: true
      t.integer    :blueprint_id,           null: false, index: true
      t.belongs_to :blueprint_type,         null: false, index: true
      t.belongs_to :facility,               null: false, index: true
      t.belongs_to :installer,              null: false, index: true
      t.belongs_to :completed_character,    index: true
      t.belongs_to :product,                polymorphic: true, index: true
      t.belongs_to :job_blueprint_location, polymorphic: true,
                                            null: false,
                                            index: { name: 'job_blueprint_location_index' }
      t.belongs_to :output_location,        polymorphic: true,
                                            null: false,
                                            index: { name: 'output_location_index' }
      t.belongs_to :job_location,           polymorphic: true,
                                            null: false,
                                            index: { name: 'job_location_index' }
      t.decimal    :cost
      t.float      :probability
      t.string     :status
      t.integer    :runs
      t.integer    :licensed_runs
      t.integer    :successful_runs
      t.integer    :duration
      t.datetime   :start_date
      t.datetime   :pause_date
      t.datetime   :completed_date
      t.datetime   :end_date

      t.timestamps null: false
    end
    add_foreign_key :industry_jobs, :blueprints, column: :blueprint_type_id,
                                                 primary_key: :type_id
    add_foreign_key :industry_jobs, :characters, column: :installer_id,
                                                 primary_key: :character_id
    add_foreign_key :industry_jobs, :characters, column: :completed_character_id,
                                                 primary_key: :character_id
  end
end
