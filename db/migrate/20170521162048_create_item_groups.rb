class CreateItemGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :item_groups, id: false do |t|
      t.integer :group_id, null: false, index: { unique: true }
      t.string :name, null: false
      t.belongs_to :category, null: false, index: true
      t.integer :data_export, null: false, default: 1, index: true
    end
  end
end
