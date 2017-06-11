class CreateMoons < ActiveRecord::Migration[5.1]
  def change
    create_table :moons, id: false do |t|
      t.integer    :moon_id, null: false, index: { unique: true }
      t.belongs_to :planet,  null: false, index: true
      t.belongs_to :solar_system,  null: false, index: true
      t.string     :name
      
      # coordinates
      t.float :x
      t.float :y
      t.float :z
    end
    add_foreign_key :moons, :planets,       primary_key: :planet_id
    add_foreign_key :moons, :solar_systems, primary_key: :system_id
  end
end
