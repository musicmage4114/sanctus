class ChangeMapCelestialStatistics < ActiveRecord::Migration[5.1]
  def change
    rename_table :mapCelestialStatistics, :celestials
    change_table :celestials do |t|
      t.rename :celestialID, :celestial_id
      t.rename :spectralClass, :spectral_class
      t.rename :orbitRadius, :orbit_radius
      t.rename :massDust, :mass_dust
      t.rename :massGas, :mass_gas
      t.rename :surfaceGravity, :surface_gravity
      t.rename :escapeVelocity, :escape_velocity
      t.rename :orbitPeriod, :orbit_period
      t.rename :rotationRate, :rotation_rate
    end
    add_foreign_key :celestials, :universe_items, column: :celestial_id,
                                                  primary_key: :item_id
  end
end
