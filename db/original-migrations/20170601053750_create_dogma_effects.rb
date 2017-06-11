class CreateDogmaEffects < ActiveRecord::Migration[5.1]
  def change
    create_table :dogma_effects, id: false do |t|
      t.integer    :effect_id,         null: false, index: { unique: true }
      t.integer    :auto_repeat,       null: false, default: 1, index: true
      t.integer    :data_export,       null: false, default: 0, index: true
      t.integer    :attribute_type,    null: false, default: 6, index: true
      t.boolean    :assistance,        null: false, default: false
      t.boolean    :offensive,         null: false, default: false
      t.boolean    :warp_safe,         null: false, default: false
      t.boolean    :range_chance,      null: false, default: false
      t.boolean    :electronic_chance, null: false, default: false
      t.belongs_to :attribute,         index: true
      t.belongs_to :icon,              index: true
      t.string     :name
      t.string     :display_name
      t.text       :description
      t.integer    :effect_category
      t.integer    :pre_expression
      t.integer    :post_expression
    end
    add_foreign_key :dogma_effects, :dogma_attributes, column: :attribute_id,
                                                       primary_key: :attribute_id
  end
end
