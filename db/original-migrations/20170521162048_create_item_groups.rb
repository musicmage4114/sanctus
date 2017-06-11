class CreateItemGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :item_groups, id: false do |t|
      t.integer    :group_id,    null: false, index: { unique: true }
      t.integer    :data_export, null: false, default: 1, index: true
      t.belongs_to :category,    null: false, index: true
      t.string     :group_type,  null: false
      t.string     :name,        null: false
    end
  end
end
