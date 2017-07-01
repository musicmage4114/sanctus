class CreateInfestedSystems < ActiveRecord::Migration[5.1]
  def change
    create_table :infested_systems, id: false do |t|
      t.belongs_to :incursion,    null: false, index: true
      t.belongs_to :solar_system, null: false, index: true
      t.integer    :type,         null: false, default: 2, index: true
    end
    add_foreign_key :infested_systems, :incursions
    add_foreign_key :infested_systems, :solar_systems, primary_key: :system_id
  end
end
