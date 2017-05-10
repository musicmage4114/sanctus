class CreateCharacters < ActiveRecord::Migration[5.0]
  def change
    create_table :characters do |t|
      t.string :name
      t.datetime :birthday
      t.string :gender
      t.float :security_status
      t.integer :race_id
      t.integer :bloodline_id
      t.integer :ancestry_id

      t.timestamps
    end
  end
end