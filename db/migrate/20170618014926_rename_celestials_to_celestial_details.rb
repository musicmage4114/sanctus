class RenameCelestialsToCelestialDetails < ActiveRecord::Migration[5.1]
  def change
    rename_table :celestials, :celestial_details
  end
end
