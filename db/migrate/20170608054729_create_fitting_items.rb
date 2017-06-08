class CreateFittingItems < ActiveRecord::Migration[5.1]
  def change
    create_table :fitting_items, id: false do |t|
      t.belongs_to :fitting,     null: false, index: true
      t.belongs_to :fitted_item, polymorphic: true, null: false, index: true
      t.integer    :flag
      t.integer    :quantity
    end
    add_foreign_key :fitting_items, :fittings, primary_key: :fitting_id
  end
end
