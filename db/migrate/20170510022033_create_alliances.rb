class CreateAlliances < ActiveRecord::Migration[5.0]
  def change
    create_table :alliances, id: false do |t|
      t.integer :alliance_id, null: false, index: { unique: true }
      t.string :name, null: false
      t.string :ticker, null: false, limit: 5
      t.datetime :date_founded, null: false
      t.belongs_to :executor_corporation, null: false, index: { unique: true }

      # urls for retrieval of alliance icon of the given size
      t.string :icon_64
      t.string :icon_128
      
      # enum - supplied parameter: boolean - is_deleted; true -> 1 -> deleted, false -> 0 -> not_deleted
      t.integer :deletion_status, index: true

      t.timestamps null: false
    end
    # foreign key: alliances -> corporations; column: executor_corporation_id, primary key: corporation_id
  end
end
