class CreateCorporationHistories < ActiveRecord::Migration[5.1]
  def change
    create_table :corporation_histories, id: false do |t|
      t.belongs_to :character,   null: false, index: true
      t.belongs_to :corporation, null: false, index: true
      t.integer    :record_id,   null: false
      t.datetime   :start_date,  null: false
    end
    add_foreign_key :corporation_histories, :characters,   primary_key: :character_id
    add_foreign_key :corporation_histories, :corporations, primary_key: :corporation_id
  end
end
