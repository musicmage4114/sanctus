class CreateAlliances < ActiveRecord::Migration[5.1]
  def change
    create_table :alliances, id: false do |t|
      t.integer    :alliance_id,          null: false, index: { unique: true }
      t.belongs_to :executor_corporation, null: false, index: { unique: true }
      t.string     :ticker,               null: false, limit: 5
      t.string     :name,                 null: false
      t.datetime   :date_founded,         null: false
      t.integer    :deletion_status,      index: true
      
      # urls for retrieval of alliance icon of the given size
      t.string :icon_64
      t.string :icon_128
      
      t.timestamps null: false
    end
    add_foreign_key :characters, :alliances,   primary_key: :alliance_id
    add_foreign_key :corporations, :alliances, primary_key: :alliance_id
    add_foreign_key :alliances, :corporations, column: :executor_corporation_id,
                                               primary_key: :corporation_id
  end
end
