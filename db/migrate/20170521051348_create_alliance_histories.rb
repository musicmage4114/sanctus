class CreateAllianceHistories < ActiveRecord::Migration[5.0]
  def change
    create_table :alliance_histories do |t|
      t.belongs_to :alliance,    null: false, index: true
      t.belongs_to :corporation, null: false, index: true
      t.integer    :record_id,   null: false
      t.datetime   :start_date,  null: false
      
      t.index [:corporation_id, :alliance_id]
    end
  end
end
