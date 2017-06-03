class CreateAssets < ActiveRecord::Migration[5.0]
  def change
    create_table :assets, id: false do |t|
      t.integer    :item_id,       null: false, index: { unique: true }
      t.integer    :multiple,      null: false, default: 1, index: true
      t.belongs_to :type,          null: false, index: true
      t.string     :location_flag, null: false
      t.belongs_to :location,      polymorphic: true, index: true
      t.belongs_to :owner,         polymorphic: true, index: true
      t.integer    :quantity
    end
    add_foreign_key :assets, :items, column: :type_id, primary_key: :type_id
  end
end
