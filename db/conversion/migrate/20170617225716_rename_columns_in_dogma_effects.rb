class RenameColumnsInDogmaEffects < ActiveRecord::Migration[5.1]
  def change
    change_table :dogma_effects do |t|
      t.rename :effectName, :name
      t.rename :displayName, :display_name
    end
  end
end
