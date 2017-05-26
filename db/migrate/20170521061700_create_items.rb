class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items, id: false do |t|
      t.integer :type_id, null: false, index: { unique: true }
      t.string :type, null: false, index: true
      t.string :name, null: false
      t.text :description
      t.belongs_to :group, null: false, index: true
      t.belongs_to :graphic, index: true
      t.float :radius
      t.float :volume
      t.belongs_to :icon, index: true
      t.float :capacity
      t.float :portion_size
      t.float :mass
  
      # enum - supplied parameter: boolean - published
      # true -> 1 -> published, false -> 0 -> unpublished
      t.integer :usage, null: false, default: 1, index: true
    end
    # foreign key: blueprints -> item_groups; column: group_id, primary key: group_id
  end
end
