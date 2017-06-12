class ChangeDgmTypeEffects < ActiveRecord::Migration[5.1]
  def change
    rename_table :dgmTypeEffects, :dogma_effect_defaults
    change_table :dogma_effect_defaults do |t|
      t.rename :typeID, :type_id
      t.index :type_id
      t.rename :effectID, :effect_id
      t.index :effect_id
      t.rename :isDefault, :default
    end
    add_foreign_key :dogma_effect_defaults, :dogma_effects, column: :effect_id,
                                                            primary_key: :effect_id
  end
end
