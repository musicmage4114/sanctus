class CreateDogmaEffects < ActiveRecord::Migration[5.1]
  def change
    create_table :dogma_effects, id: false do |t|
      t.integer :effect_id, null: false, index: { unique: true }
      t.string :name
      t.string :display_name
      t.text :description
      t.integer :effect_category
      t.integer :icon_id
      t.integer :pre_expression
      t.integer :post_expression
      t.boolean :electronic_chance
      t.boolean :assistance
      t.boolean :offensive
      t.boolean :warp_safe
      t.boolean :range_chance
      
      # associated attribute IDs
      t.belongs_to :discharge_attribute
      t.belongs_to :duration_attribute
      t.belongs_to :falloff_attribute
      t.belongs_to :range_attribute
      t.belongs_to :tracking_speed_attribute
      
      # effect modifier
      t.string :domain
      t.string :func
      t.integer :operator
      t.belongs_to :modified_attribute
      t.belongs_to :modifying_attribute
      
      # enums
      t.integer :auto_repeat
      t.integer :data_export
    end
    add_foreign_key :dogma_effects, :dogma_attributes, column: :discharge_attribute_id, primary_key: :attribute_id
    add_foreign_key :dogma_effects, :dogma_attributes, column: :duration_attribute_id, primary_key: :attribute_id
    add_foreign_key :dogma_effects, :dogma_attributes, column: :falloff_attribute_id, primary_key: :attribute_id
    add_foreign_key :dogma_effects, :dogma_attributes, column: :modified_attribute_id, primary_key: :attribute_id
    add_foreign_key :dogma_effects, :dogma_attributes, column: :modifying_attribute_id, primary_key: :attribute_id
    add_foreign_key :dogma_effects, :dogma_attributes, column: :range_attribute_id, primary_key: :attribute_id
    add_foreign_key :dogma_effects, :dogma_attributes, column: :tracking_speed_attribute_id, primary_key: :attribute_id
  end
end
