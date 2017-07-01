class ChangeIndustryBlueprints < ActiveRecord::Migration[5.1]
  def change
    rename_table :industryBlueprints, :blueprint_production_limits
    change_table :blueprint_production_limits do |t|
      t.rename :typeID, :blueprint_id
      t.rename :maxProductionLimit, :max_production
    end
  end
end
