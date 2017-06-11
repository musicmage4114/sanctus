class CreateIndustryCostIndices < ActiveRecord::Migration[5.1]
  def change
    create_table :industry_cost_indices, id: false do |t|
      t.belongs_to :system, null: false, index: { unique: true }
      t.decimal    :invention
      t.decimal    :manufacturing
      t.decimal    :time_efficiency
      t.decimal    :material_efficiency
      t.decimal    :copying

      t.timestamps null: false
    end
    add_foreign_key :industry_cost_indices, :solar_systems, column: :system_id,
                                                            primary_key: :system_id
  end
end
