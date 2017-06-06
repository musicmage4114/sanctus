class CreateSovereigntyCampaigns < ActiveRecord::Migration[5.1]
  def change
    create_table :sovereignty_campaigns, id: false do |t|
      t.integer    :campaign_id,   null: false, index: { unique: true }
      t.belongs_to :constellation, null: false, index: true
      t.belongs_to :solar_system,  null: false, index: true
      t.belongs_to :sov_structure, null: false, index: true
      t.integer    :event_type,    null: false, default: 1, index: true
      t.datetime   :start_time,    null: false

      t.timestamps null: false
    end
    add_foreign_key :sovereignty_campaigns, :constellations, primary_key: :constellation_id
    add_foreign_key :sovereignty_campaigns, :solar_systems, primary_key: :solar_system_id
  end
end
