class CreateCorporations < ActiveRecord::Migration[5.0]
  def change
    create_table :corporations do |t|
      t.string :name
      t.string :ticker
      t.decimal :tax_rate, precision: 4, scale: 3
      t.datetime :creation_date
      t.integer :member_count
      t.integer :ceo_id
      t.integer :creator_id
      t.string :url

      t.timestamps
    end
  end
end
