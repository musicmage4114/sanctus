class CreateItemCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :item_categories, id: false do |t|
      t.integer :category_id, null: false, index: { unique: true }
      t.integer :data_export, null: false, default: 1, index: true
      t.string  :name,        null: false
    end
    add_foreign_key :item_groups, :item_categories, column: :category_id,
                                                    primary_key: :category_id
  end
end
