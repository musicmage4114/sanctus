class CreateAllianceHistories < ActiveRecord::Migration[5.1]
  def change
    create_table :alliance_histories do |t|
      t.belongs_to :alliance,    null: false, index: true
      t.belongs_to :corporation, null: false, index: true
      t.integer    :record_id,   null: false
      t.datetime   :start_date,  null: false
      
      t.index [:corporation_id, :alliance_id]
    end
    add_foreign_key :alliance_histories, :corporations, primary_key: :corporation_id
    add_foreign_key :alliance_histories, :alliances,    primary_key: :alliance_id
  end
end