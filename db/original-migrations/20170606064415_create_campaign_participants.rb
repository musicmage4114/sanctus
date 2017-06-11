class CreateCampaignParticipants < ActiveRecord::Migration[5.1]
  def change
    create_table :campaign_participants, id: false do |t|
      t.belongs_to :campaign, null: false, index: true
      t.belongs_to :alliance, null: false, index: true
      t.integer :role,        null: false, default: 3, index: true
      t.float :score,         null: false, default: 0

      t.timestamps null: false
    end
    add_foreign_key :campaign_participants, :sovereignty_campaigns, column: :campaign_id,
                                                                    primary_key: :campaign_id
    add_foreign_key :campaign_participants, :alliances,             primary_key: :alliance_id
  end
end
