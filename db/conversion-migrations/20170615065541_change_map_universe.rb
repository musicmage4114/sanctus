class ChangeMapUniverse < ActiveRecord::Migration[5.1]
  def change
    rename_table :mapUniverse, :universes
    change_table :universes do |t|
      t.rename :universeID, :universe_id
      t.rename :universeName, :name
      t.rename :xMin, :x_min
      t.rename :xMax, :x_max
      t.rename :yMin, :y_min
      t.rename :yMax, :y_max
      t.rename :zMin, :z_min
      t.rename :zMax, :z_max
    end
  end
end
