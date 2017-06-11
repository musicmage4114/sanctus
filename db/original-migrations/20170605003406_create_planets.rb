class CreatePlanets < ActiveRecord::Migration[5.1]
  def change
    create_table :planets, id: false do |t|
      t.integer    :planet_id,       null: false, index: { unique: true }
      t.belongs_to :solar_system,    null: false, index: true
      t.string     :name,            null: false
      t.integer    :type,            null: false
      t.integer    :asteroid_belts
      t.integer    :ice_belts
      
      # item attributes
      t.integer    :data_export, null: false, default: 1, index: true
      t.belongs_to :group,       null: false, index: true
      t.integer    :type_id,     null: false
      t.text       :description
      t.integer    :icon_id
      t.integer    :graphic_id
      
      # coordinates
      t.float :x
      t.float :y
      t.float :z
    end
    add_foreign_key :planets, :solar_systems, primary_key: :system_id
  end
end
