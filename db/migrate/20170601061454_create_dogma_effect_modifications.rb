class CreateDogmaEffectModifications < ActiveRecord::Migration[5.1]
  def change
    create_table :dogma_effect_modifications, id: false do |t|
      t.belongs_to :effect,              null: false, index: true
      t.belongs_to :modified_attribute,  index: true
      t.belongs_to :modifying_attribute, index: true
      t.string     :domain
      t.string     :func
      t.integer    :operator
    end
    add_foreign_key :dogma_effect_modifications, :dogma_effects,    column: :effect_id,
                                                                    primary_key: :effect_id
    add_foreign_key :dogma_effect_modifications, :dogma_attributes, column: :modified_attribute_id,
                                                                    primary_key: :attribute_id
    add_foreign_key :dogma_effect_modifications, :dogma_attributes, column: :modifying_attribute_id,
                                                                    primary_key: :attribute_id
  end
end
