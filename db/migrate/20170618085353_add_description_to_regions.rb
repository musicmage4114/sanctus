class AddDescriptionToRegions < ActiveRecord::Migration[5.1]
  def change
    change_table :regions do |t|
      t.text :description
    end
  end
end
