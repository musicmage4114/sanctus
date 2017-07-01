class CreateFittingItems < ActiveRecord::Migration[5.1]
  def change
    create_table :fitting_items, id: false do |t|
      t.belongs_to :fitting, null: false, index: true
      t.belongs_to :type,    null: false, index: true
      t.integer    :flag
      t.integer    :quantity
    end
    add_foreign_key :fitting_items, :fittings, primary_key: :fitting_id
    add_foreign_key :fitting_items, :items,    column: :type_id,
                                               primary_key: :type_id
  end
end
