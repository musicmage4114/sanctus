class CreatePlanets < ActiveRecord::Migration[5.1]
  def change
    create_table :planets, id: false do |t|
      t.integer    :planet_id,    null: false, index: { unique: true }
      t.belongs_to :solar_system, null: false, index: true
      t.string     :name,         null: false
      t.belongs_to :type,         null: false
      t.float :x
      t.float :y
      t.float :z
    end
    add_foreign_key :planets, :solar_systems, primary_key: :system_id
    add_foreign_key :planets, :items,         column: :type_id,
                                              primary_key: :type_id
  end
end
