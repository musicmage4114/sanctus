class CreateDogmaEffectDefaults < ActiveRecord::Migration[5.1]
  def change
    create_table :dogma_effect_defaults, id: false do |t|
      t.belongs_to :dogma_effect, null: false, index: true
      t.belongs_to :entity,       polymorphic: true,
                                  null: false,
                                  index: { name: 'dogma_effect_default_index' }
      t.boolean    :default,      null: false, default: true
    end
    add_foreign_key :dogma_effect_defaults, :dogma_effects, primary_key: :effect_id
  end
end
