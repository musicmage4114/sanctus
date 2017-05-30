class CreateItemGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :item_groups, id: false do |t|
      t.integer :group_id, null: false, index: { unique: true }
      t.string :name, null: false
      t.belongs_to :category, null: false, index: true

      # enum - supplied parameter: boolean - published
      # true -> 1 -> published, false -> 0 -> unpublished
      t.integer :usage, null: false, default: 1, index: true
    end
    # foreign key: item_groups -> item_categories; column: category_id, primary key: category_id
  end
end
