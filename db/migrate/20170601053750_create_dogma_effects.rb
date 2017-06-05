class CreateDogmaEffects < ActiveRecord::Migration[5.1]
  def change
    create_table :dogma_effects, id: false do |t|
      t.integer    :effect_id, null: false, index: { unique: true }
      t.belongs_to :attribute, index: true
      t.string     :attribute_type
      t.string     :name
      t.string     :display_name
      t.text       :description
      t.integer    :effect_category
      t.integer    :icon_id
      t.integer    :pre_expression
      t.integer    :post_expression
      t.boolean    :electronic_chance
      t.boolean    :assistance
      t.boolean    :offensive
      t.boolean    :warp_safe
      t.boolean    :range_chance
      
      # effect modifier
      t.string     :domain
      t.string     :func
      t.integer    :operator
      t.belongs_to :modified_attribute
      t.belongs_to :modifying_attribute
      
      # enums
      t.integer    :auto_repeat
      t.integer    :data_export
    end
    add_foreign_key :dogma_effects, :dogma_attributes, column: :attribute_id,
                                                       primary_key: :attribute_id
    add_foreign_key :dogma_effects, :dogma_attributes, column: :modified_attribute_id,
                                                       primary_key: :attribute_id
    add_foreign_key :dogma_effects, :dogma_attributes, column: :modifying_attribute_id,
                                                       primary_key: :attribute_id
  end
end
