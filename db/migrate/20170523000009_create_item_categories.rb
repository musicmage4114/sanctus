class CreateItemCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :item_categories, id: false do |t|
      t.integer :category_id, null: false, index: { unique: true }
      t.string :name, null: false
      t.integer :data_export, null: false, default: 1, index: true
    end
  end
end
