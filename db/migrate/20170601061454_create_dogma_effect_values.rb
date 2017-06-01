class CreateDogmaEffectValues < ActiveRecord::Migration[5.1]
  def change
    create_table :dogma_effect_values, id: false do |t|
      t.belongs_to :effect, null: false, index: true
      t.belongs_to :type, null: false, index: true
      t.boolean :default_value
      t.index [:type_id, :effect_id]
    end
    add_foreign_key :dogma_effect_values, :dogma_effects, column: :effect_id, primary_key: :effect_id
    add_foreign_key :dogma_effect_values, :items, column: :type_id, primary_key: :type_id
  end
end
