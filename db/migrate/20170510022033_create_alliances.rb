class CreateAlliances < ActiveRecord::Migration[5.0]
  def change
    create_table :alliances do |t|
      t.string :name
      t.string :ticker
      t.datetime :date_founded
      t.integer :executor_corp

      t.timestamps
    end
  end
end
