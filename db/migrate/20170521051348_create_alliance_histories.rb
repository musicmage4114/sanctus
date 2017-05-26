class CreateAllianceHistories < ActiveRecord::Migration[5.0]
  def change
    create_table :alliance_histories do |t|
      t.belongs_to :alliance, null: false, index: true
      t.belongs_to :corporation, null: false, index: true
      t.integer :record_id, null: false
      t.datetime :start_date, null: false
    end
    # foreign key: alliance_histories -> corporations; primary key: corporation_id
    # foreign key: alliance_histories -> alliances; primary key: alliance_id
  end
end
